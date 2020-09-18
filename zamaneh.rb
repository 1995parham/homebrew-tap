# This file was generated by GoReleaser. DO NOT EDIT.
class Zamaneh < Formula
  desc "Manage your working periods with ease"
  homepage ""
  version "0.0.4"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/1995parham/zamaneh/releases/download/v0.0.4/zamaneh_0.0.4_darwin_amd64.tar.gz"
    sha256 "d721f820996111ad4c90b703a3ba251939f2b84d52385c1a64d50b86cf4cb96e"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/1995parham/zamaneh/releases/download/v0.0.4/zamaneh_0.0.4_linux_amd64.tar.gz"
      sha256 "0d99139862ba7305dca6574a57d00e58d61decda2901a6a9c94a70122056b1f5"
    end
  end

  def install
    bin.install "zamaneh"
  end
end
