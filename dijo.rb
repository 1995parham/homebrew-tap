class Dijo < Formula
  desc "scriptable, curses-based, digital habit tracker"
  homepage "https://github.com/1995parham/dijo"
  license "MIT"
  version "v1.4.0"

  on_arm do
    sha256 "9fb0658e461d25a3081d84b448db067b934501c487ffb528d30e64ce6115494c"
    url "https://github.com/1995parham/dijo/releases/download/#{version}/dijo-aarch64-apple-darwin.tar.gz"
  end

  on_intel do
    sha256 "bc955c5dd044adea78b604ac2d36e760f77f7cc7ad5f1643ce52a6ee75150369"
    url "https://github.com/1995parham/dijo/releases/download/#{version}/dijo-x86_64-apple-darwin.tar.gz"
  end

  def install
    bin.install "dijo" => "dijo"
    man1.install "dijo.1" => "dijo.1"
  end

  test do
    system "#{bin}/dijo", "--version"
  end
end
