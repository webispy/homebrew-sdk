require_relative "../lib/GitHubPrivateRepositoryReleaseDownloadStrategy"

class LibnuguKwd < Formula
  desc "C/C++ library for NUGU SDK Keyword detector"
  homepage "https://github.com/nugulinux/keyword-detector"
  # Use URL fragment to prevent brew audit failures for private repository.
  url "https://github.com/nugulinux/#keyword-detector/releases/download/0.9.38ubuntu6osx/libnugu-kwd-src.tgz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "ca0c194fc6aa40fc7e4a1d1198819c2971b80d6dca4795667ba0ad689bdd27bd"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/libnugu-kwd-0.9.38"
    rebuild 2
    sha256 cellar: :any, monterey: "58340893d42bcf83fb997c7b139d47c3d1a91f28eeb3e03c83c1c822a1d6d67b"
    sha256 cellar: :any, big_sur:  "c51972d5ed64594bc1c13e6635fee9343ed5fd7773aafb043680180608ae445a"
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
