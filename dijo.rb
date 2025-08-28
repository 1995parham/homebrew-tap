class Dijo < Formula
  desc "scriptable, curses-based, digital habit tracker"
  homepage "https://github.com/1995parham/dijo"
  license "MIT"
  version "v0.4.5"

  sha256 "3ae7f98f83b5c0df0ca1a752107cd91c0cd55c3628b47ffe5de92074e0bdc36c"
  url "https://github.com/1995parham/dijo/releases/download/#{version}/dijo-aarch64-apple-darwin.tar.gz"

  def install
    bin.install "dijo" => "dijo"
    man1.install "dijo.1" => "dijo.1"
  end

  test do
    system "#{bin}/dijo", "--version"
  end
end
