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
    rebuild 3
    sha256 cellar: :any, arm64_monterey: "a531b4f7168dced23960234770fbe33aae3897519e5a394c78706560e3d5f890"
    sha256 cellar: :any, monterey:       "bd084749a53dfca65350920c019f7a2f3213a65a93a6dd838fbfe6898008e678"
    sha256 cellar: :any, big_sur:        "c1bf6d4e23d16af0a01f1d458748da4e0cefcfff085d782858de75002329a75b"
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
