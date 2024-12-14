class Dijo < Formula
  desc "scriptable, curses-based, digital habit tracker"
  homepage "https://github.com/nerdypepper/dijo"
  license "MIT"
  version "v0.2.9"

  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  url "https://github.com/1995parham/dijo/releases/download/#{version}/dijo-aarch64-apple"

  def install
    bin.install "dijo-aarach64-apple" => "dijo"
  end

  test do
    system "#{bin}/dijo", "--version"
  end
end
