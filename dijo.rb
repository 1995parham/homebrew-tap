class Dijo < Formula
  desc "scriptable, curses-based, digital habit tracker"
  homepage "https://github.com/1995parham/dijo"
  license "MIT"
  version "v0.4.6"

  on_arm do
    sha256 "34a851015eda139dd502785f24f5524b59d842bcc63c2c258e778f01a59028ac"
    url "https://github.com/1995parham/dijo/releases/download/#{version}/dijo-aarch64-apple-darwin.tar.gz"
  end

  on_intel do
    sha256 "6e482173205a206a2b886212039e7a971fe33600a041a742f512d78ad78178ed"
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
