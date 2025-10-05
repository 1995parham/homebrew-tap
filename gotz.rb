class Gotz < Formula
  desc "CLI timezone info"
  homepage "https://github.com/merschformann/gotz"
  license "MIT"
  version "0.1.15"

  on_macos do
    on_intel do
      url "https://github.com/merschformann/gotz/releases/download/v#{version}/gotz_#{version}_darwin_amd64.tar.gz"
      sha256 "6efde1ef594d8ba1bfcabbd4cd6c684a2a41d56210ce234a082945c68fce8049"
    end
    on_arm do
      url "https://github.com/merschformann/gotz/releases/download/v#{version}/gotz_#{version}_darwin_arm64.tar.gz"
      sha256 "3e7570134e4eda2faea64ee24928372debdfd03f9c54809de4ec4fc2952492b4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/merschformann/gotz/releases/download/v#{version}/gotz_#{version}_linux_amd64.tar.gz"
      sha256 "2a2766c2e96407ddd2be8bc1e6da5d234251b80c2df77b034d58d1862996372f"
    end
    on_arm do
      url "https://github.com/merschformann/gotz/releases/download/v#{version}/gotz_#{version}_linux_arm64.tar.gz"
      sha256 "8cd548bb713ea926f710945aad2953ed4ce41965bbd4da4237cefd2f2152f3cb"
    end
  end

  def install
    bin.install "gotz"
  end
end
