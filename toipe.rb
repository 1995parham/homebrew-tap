class Dijo < Formula
  desc "yet another typing test, but crab flavoured"
  homepage "https://github.com/Samyak2/toipe"
  sha256 "31e4c7679487425254ad90bbc4d14a9bd55af6c6a20cce0b3f8eaa52fffe6bf7"
  url "https://github.com/Samyak2/toipe/archive/refs/tags/v0.5.0.tar.gz"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/toipe", "--help"
  end
end
