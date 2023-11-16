class Dijo < Formula
  desc "scriptable, curses-based, digital habit tracker"
  homepage "https://github.com/nerdypepper/dijo"
  sha256 "d82ce7adb19e5206e014f0a895fe3ed361f32088048116e9d33aea37f3cccb00"
  url "https://github.com/nerdypepper/dijo/archive/refs/tags/v0.2.7.tar.gz"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/dijo", "--version"
  end
end
