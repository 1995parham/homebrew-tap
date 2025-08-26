class Dijo < Formula
  desc "scriptable, curses-based, digital habit tracker"
  homepage "https://github.com/1995parham/dijo"
  license "MIT"
  version "v0.4.1"

  sha256 "955fcf82d4b570c7e75aa2ee280e317a6d5d52e26b82140dfb7a5804e32b7b17"
  url "https://github.com/1995parham/dijo/releases/download/#{version}/dijo-aarch64-apple"

  def install
    bin.install "dijo-aarch64-apple" => "dijo"
  end

  test do
    system "#{bin}/dijo", "--version"
  end
end
