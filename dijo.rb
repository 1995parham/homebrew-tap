class Dijo < Formula
  desc "scriptable, curses-based, digital habit tracker"
  homepage "https://github.com/1995parham/dijo"
  license "MIT"
  version "v0.4.2"

  sha256 "415359122faddeee5adca5f8ca3969e3b92b698514a360f26dd38a4dfb544f5e"
  url "https://github.com/1995parham/dijo/releases/download/#{version}/dijo-aarch64-apple"

  def install
    bin.install "dijo-aarch64-apple" => "dijo"
  end

  test do
    system "#{bin}/dijo", "--version"
  end
end
