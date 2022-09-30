require_relative "../lib/GitHubPrivateRepositorySnapshotDownloadStrategy"

class LibnuguExtension < Formula
  desc "C/C++ library for NUGU SDK Extension"
  homepage "https://github.com/nugulinux/nugu-extension"
  # Use URL fragment to prevent brew audit failures for private repository.
  url "https://github.com/webispy/#nugu-extension/archive/4e39486.tar.gz", using: GitHubPrivateRepositorySnapshotDownloadStrategy
  version "1.7.3"
  sha256 "7ccbacb83e71af853d2037521bca468f1bf3b80b2d9acfb40b71413eda756efb"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/libnugu-extension-1.7.3"
    rebuild 1
    sha256 arm64_monterey: "65731ad2f001041c2833a67febb13b3fa51f0210fadcbe7fcb9f5825d52e4ba5"
    sha256 monterey:       "8f5ac2d978a28edeae85eba3364451891da81bebfdaa050094c99c6c92bab42b"
    sha256 big_sur:        "af29d4c9a351edb3540172c4a2dc46b3a349144d350d8b8e19e73920bf81c124"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "libnugu"
  depends_on "sqlite3"

  def install
    args = %W[
      -DENABLE_LIBRARY_ONLY=ON
      -DENABLE_SYSTEM_STORAGE_DIR=OFF
      -DENABLE_HOME_STORAGE_DIR=ON
      -DMODEL_DIR=#{Formula["libnugu"].share}/nugu/model
      -DPACKAGING=ON
    ]

    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "true"
  end
end
