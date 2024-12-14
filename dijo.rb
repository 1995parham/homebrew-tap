class Dijo < Formula
  desc "scriptable, curses-based, digital habit tracker"
  homepage "https://github.com/nerdypepper/dijo"
  license "MIT"
  version "v0.2.9"

  sha256 "ea4dbcdc8a24bb37bbf22ffe4e54338550911fe519d4626563ea38d3381bc425"
  url "https://github.com/1995parham/dijo/releases/download/#{version}/dijo-aarch64-apple"

  def install
    bin.install "dijo-aarach64-apple" => "dijo"
  end

  test do
    system "#{bin}/dijo", "--version"
  end
end
