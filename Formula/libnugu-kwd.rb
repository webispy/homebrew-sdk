require_relative "../lib/GitHubPrivateRepositoryReleaseDownloadStrategy"

class LibnuguKwd < Formula
  desc "C/C++ library for NUGU SDK Keyword detector"
  homepage "https://github.com/nugulinux/keyword-detector"
  # Use URL fragment to prevent brew audit failures for private repository.
  url "https://github.com/nugulinux/#keyword-detector/releases/download/0.9.38ubuntu6osx/libnugu-kwd-src.tgz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "3ac6790025f169b9eb85ef5be7749acd6a4cf6def5dd4ac50c0621b8721a8371"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/libnugu-kwd-0.9.38"
    rebuild 1
    sha256 cellar: :any, monterey: "d6e68c1bbb4f2b4699c6d255584e139b36ca6f926dee3b034ced0a6b9cfb2ae2"
    sha256 cellar: :any, big_sur:  "c62905b236a553d637d8e9d3364790c942004ea40f8a8a762f289f6eadd3d85a"
  end

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "true"
  end
end
