#!/usr/bin/env python3
"""Update a Homebrew formula to a new version.

A formula states its version in one of two ways, and the script handles both:

- a `version` line, with `#{version}` interpolated in each `url` (dijo). The
  script rewrites the `version` line.
- the version written directly in each `url` (gotz, toipe), which is what
  `brew audit --strict` demands when Homebrew can read the version from the URL.
  The script rewrites the version inside each `url`.

In both cases it then recomputes every `sha256` by downloading the matching
`url`.

Usage:
    update-formula.py <formula.rb> <new-version>

`<new-version>` may be given with or without a leading `v`; the script keeps the
prefix style already used by the formula.
"""

import hashlib
import re
import sys
import urllib.request

VERSION_RE = re.compile(r'^(\s*version\s+")([^"]+)(".*)$', re.MULTILINE)
URL_RE = re.compile(r'^\s*url\s+"([^"]+)"')
SHA_RE = re.compile(r'^(\s*sha256\s+")([0-9a-f]+)(".*)$')
# The version inside a release URL: a path segment (`/v1.2.3/`) or the name of a
# source archive (`/v1.2.3.tar.gz`).
URL_VERSION_RE = re.compile(r"/v?(\d+(?:\.\d+)+)(?=/|\.tar\.gz|\.tgz|\.zip)")


def sha256_of(url: str) -> str:
    if not url.startswith("https://"):
        raise ValueError(f"refusing to fetch non-https url: {url}")
    print(f"    downloading {url}", file=sys.stderr)
    h = hashlib.sha256()
    with urllib.request.urlopen(url) as resp:
        for chunk in iter(lambda: resp.read(1 << 16), b""):
            h.update(chunk)
    return h.hexdigest()


def main() -> int:
    if len(sys.argv) != 3:
        print(__doc__, file=sys.stderr)
        return 2

    path, new_version = sys.argv[1], sys.argv[2]
    with open(path, encoding="utf-8") as f:
        text = f.read()

    m = VERSION_RE.search(text)
    if m:
        old_stored = m.group(2)
        # Preserve the formula's own prefix convention (dijo stores "v1.1.0").
        stored = ("v" if old_stored.startswith("v") else "") + new_version.lstrip("v")
        if stored == old_stored:
            print(f"{path}: already at {old_stored}, nothing to do")
            return 0

        print(f"{path}: {old_stored} -> {stored}")
        text = VERSION_RE.sub(
            lambda mm: mm.group(1) + stored + mm.group(3), text, count=1
        )
        lines = text.split("\n")
    else:
        # No `version` line: the version is written in the urls themselves.
        lines = text.split("\n")
        found = next(
            (
                um
                for ln in lines
                if URL_RE.match(ln) and (um := URL_VERSION_RE.search(ln))
            ),
            None,
        )
        if not found:
            print(f"error: no version found in {path}", file=sys.stderr)
            return 1
        old, new = found.group(1), new_version.lstrip("v")
        if old == new:
            print(f"{path}: already at {old}, nothing to do")
            return 0

        print(f"{path}: {old} -> {new}")
        lines = [ln.replace(old, new) if URL_RE.match(ln) else ln for ln in lines]
        stored = new

    # Recompute each sha256 by re-downloading its matching url. Handle both line
    # orderings (sha256 before url, as in dijo; url before sha256, as in gotz)
    # by pairing each url with the nearest sha256 line within the same block.
    url_idxs = [i for i, ln in enumerate(lines) if URL_RE.match(ln)]
    sha_idxs = [i for i, ln in enumerate(lines) if SHA_RE.match(ln)]
    used: set[int] = set()

    for ui in url_idxs:
        # `#{version}` in the Ruby string expands to the exact `version` value,
        # so a single substitution covers both `#{version}` and `v#{version}`.
        url = URL_RE.match(lines[ui]).group(1).replace("#{version}", stored)
        # nearest unused sha256 line (prefer the closest, either direction)
        candidates = sorted((abs(si - ui), si) for si in sha_idxs if si not in used)
        if not candidates:
            continue
        si = candidates[0][1]
        used.add(si)
        digest = sha256_of(url)
        sm = SHA_RE.match(lines[si])
        lines[si] = sm.group(1) + digest + sm.group(3)

    with open(path, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
