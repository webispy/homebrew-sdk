require_relative "../lib/GitHubPrivateRepositoryReleaseDownloadStrategy"

class LibnuguKwd < Formula
  desc "C/C++ library for NUGU SDK Keyword detector"
  homepage "https://github.com/nugulinux/keyword-detector"
  # Use URL fragment to prevent brew audit failures for private repository.
  url "https://github.com/nugulinux/#keyword-detector/releases/download/0.9.38ubuntu6osx/libnugu-kwd-src.tgz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "ed74490c6215c1fcc0dbe3cea03e01f4c7b5057c8be56014c87a46d56ac547fc"
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
