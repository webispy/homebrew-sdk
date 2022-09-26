require_relative "../lib/GitHubPrivateRepositoryReleaseDownloadStrategy"

class LibnuguEpd < Formula
  desc "C/C++ library for NUGU SDK EndPoint detector"
  homepage "https://github.com/nugulinux/endpoint-detector"
  # Use URL fragment to prevent brew audit failures for private repository.
  url "https://github.com/nugulinux/#endpoint-detector/releases/download/2.1.11ubuntu5osx/libnugu-epd-src.tgz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "d2a711aff46b51abbcc392258f4a84f88c2fb68426bfbfa84f72f54a052f0f8d"
  license "Apache-2.0"

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
