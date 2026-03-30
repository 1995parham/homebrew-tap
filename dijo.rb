class Dijo < Formula
  desc "scriptable, curses-based, digital habit tracker"
  homepage "https://github.com/1995parham/dijo"
  license "MIT"
  version "v1.0.0"

  on_arm do
    sha256 "b71ffcb22ef628869f3e8956c195aab02a6db35662be26565a82d859b8b444f9"
    url "https://github.com/1995parham/dijo/releases/download/#{version}/dijo-aarch64-apple-darwin.tar.gz"
  end

  on_intel do
    sha256 "a3a4957eca5fbe07908db8aea4996620675d4064c7764182267f12e68551adc4"
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
