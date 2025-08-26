class Dijo < Formula
  desc "scriptable, curses-based, digital habit tracker"
  homepage "https://github.com/nerdypepper/dijo"
  license "MIT"
  version "v0.4.0"

  sha256 "c36b2341e5e5f302c11822429a78724bd3fcef855642cf1a0c3d105734fa023a"
  url "https://github.com/1995parham/dijo/releases/download/#{version}/dijo-aarch64-apple"

  def install
    bin.install "dijo-aarch64-apple" => "dijo"
  end

  test do
    system "#{bin}/dijo", "--version"
  end
end
