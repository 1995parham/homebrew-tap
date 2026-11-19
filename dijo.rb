class Dijo < Formula
  desc "scriptable, curses-based, digital habit tracker"
  homepage "https://github.com/1995parham/dijo"
  license "MIT"
  version "v1.6.0"

  on_arm do
    sha256 "bda2138fc929aaad3e161d8e90d23443f83954a2617678a511d2b272fe927909"
    url "https://github.com/1995parham/dijo/releases/download/#{version}/dijo-aarch64-apple-darwin.tar.gz"
  end

  on_intel do
    sha256 "1de67b8ec7766f50816c37eabfd928c736e52001340d729445d0738b467dcd54"
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
