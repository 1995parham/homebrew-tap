class Dijo < Formula
  desc "scriptable, curses-based, digital habit tracker"
  homepage "https://github.com/nerdypepper/dijo"
  license "MIT"
  version "v0.2.9"

  sha256 "b36f2a393e44fba54deac66d99e69e1f770e846ed8f0aa4b06ff8d82a0b2a5b2"
  url "https://github.com/1995parham/dijo/releases/download/#{version}/dijo-aarch64-apple"

  def install
    bin.install "dijo-aarach64-apple" => "dijo"
  end

  test do
    system "#{bin}/dijo", "--version"
  end
end
