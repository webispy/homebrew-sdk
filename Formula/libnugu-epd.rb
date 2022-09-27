require_relative "../lib/GitHubPrivateRepositoryReleaseDownloadStrategy"

class LibnuguEpd < Formula
  desc "C/C++ library for NUGU SDK EndPoint detector"
  homepage "https://github.com/nugulinux/endpoint-detector"
  # Use URL fragment to prevent brew audit failures for private repository.
  url "https://github.com/nugulinux/#endpoint-detector/releases/download/2.1.11ubuntu5osx/libnugu-epd-src.tgz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "e005e99f722ba80745b31475a61a47fb1f8c3dc2569e0c0dc985309abd6e4cfb"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/libnugu-epd-2.1.11"
    rebuild 1
    sha256 cellar: :any, monterey: "19bb587933274c2e143b16c22a9683ebc342e35fc3a32a442ec301608e7bd342"
    sha256 cellar: :any, big_sur:  "ea3daf95717375100907d30b71601b89c54df475f5f2b211c53b124647bf2f24"
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
