class Gotz < Formula
  desc "CLI timezone info"
  homepage "https://github.com/merschformann/gotz"
  license "MIT"
  version "0.1.9"

  if OS.mac?
    sha256 "ea4dbcdc8a24bb37bbf22ffe4e54338550911fe519d4626563ea38d3381bc425"
    url "https://github.com/merschformann/gotz/releases/download/v0.1.9/gotz_darwin_arm64"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/merschformann/gotz/releases/download/v0.1.9/gotz_amd_amd64"
      sha256 "99e870ecce0a0bf28e04940c4daaaf1461b185b926c91624118c9ff829a5f4fd"
    end
  end

  def install
    bin.install "gotz"
  end
end
