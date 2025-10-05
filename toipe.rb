class Toipe < Formula
  desc "yet another typing test, but crab flavoured"
  homepage "https://github.com/Samyak2/toipe"
  version "0.5.0"
  url "https://github.com/Samyak2/toipe/archive/refs/tags/v#{version}.tar.gz"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/toipe", "--help"
  end
end
