class Dijo < Formula
  desc "scriptable, curses-based, digital habit tracker"
  homepage "https://github.com/nerdypepper/dijo"
  license "MIT"
  version "v0.4.0"

  sha256 "bc8bbdf78a157fc468c45e4d72e995a14dfba9872bbb5a48b87aa1e2a8284a96"
  url "https://github.com/1995parham/dijo/releases/download/#{version}/dijo-aarch64-apple"

  def install
    bin.install "dijo-aarch64-apple" => "dijo"
  end

  test do
    system "#{bin}/dijo", "--version"
  end
end
