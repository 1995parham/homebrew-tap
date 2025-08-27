class Dijo < Formula
  desc "scriptable, curses-based, digital habit tracker"
  homepage "https://github.com/1995parham/dijo"
  license "MIT"
  version "v0.4.4"

  sha256 "fd32a6ed71795ebab2ede1b6fd749c04048f980cafea7826c00e5f60d1bcb1b0"
  url "https://github.com/1995parham/dijo/releases/download/#{version}/dijo-aarch64-apple"

  def install
    bin.install "dijo-aarch64-apple" => "dijo"
    # man1.install "dijo.1"
  end

  test do
    system "#{bin}/dijo", "--version"
  end
end
