require_relative "../lib/GitHubPrivateRepositoryReleaseDownloadStrategy"

class LibnuguKwd < Formula
  desc "C/C++ library for NUGU SDK Keyword detector"
  homepage "https://github.com/nugulinux/keyword-detector"
  # Use URL fragment to prevent brew audit failures for private repository.
  url "https://github.com/nugulinux/#keyword-detector/releases/download/0.9.38ubuntu6osx/libnugu-kwd-src.tgz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "ed74490c6215c1fcc0dbe3cea03e01f4c7b5057c8be56014c87a46d56ac547fc"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/libnugu-kwd-0.9.38"
    sha256 cellar: :any, monterey: "8b7d0da1a01554290d7e23e5b6f4b474e2a53977e1ce6af3f38e880d1c7e005a"
    sha256 cellar: :any, big_sur:  "fe2fca1e61182fbc311b24fee586260e3a963a7cf6d15e7da711be0c3ee58d05"
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
