class Dijo < Formula
  desc "scriptable, curses-based, digital habit tracker"
  homepage "https://github.com/1995parham/dijo"
  license "MIT"
  version "v1.3.0"

  on_arm do
    sha256 "4bfd9edb4bba2259afa16a4301cc2a7f6374acdd70815ca37675d4f3902140f2"
    url "https://github.com/1995parham/dijo/releases/download/#{version}/dijo-aarch64-apple-darwin.tar.gz"
  end

  on_intel do
    sha256 "146d585f498b364dc62bfcbf3e6778337a702adbb81951448279240a97e5ff34"
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
