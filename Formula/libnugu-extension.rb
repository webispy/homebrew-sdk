require_relative "../lib/GitHubPrivateRepositorySnapshotDownloadStrategy"

class LibnuguExtension < Formula
  desc "C/C++ library for NUGU SDK Extension"
  homepage "https://github.com/nugulinux/nugu-extension"
  # Use URL fragment to prevent brew audit failures for private repository.
  url "https://github.com/webispy/#nugu-extension/archive/refs/tags/v1.7.6.tar.gz", using: GitHubPrivateRepositorySnapshotDownloadStrategy
  sha256 "54f7489a1ea330f2b16ae792a934861303601e59bd3b39893deff46aabc117a8"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/libnugu-extension-1.7.5"
    sha256 arm64_sonoma: "47bce722f90fc692cc27762e7e3b871a43cdaa86f0b67362024fa4af84ae0981"
    sha256 ventura:      "0734604bbc60b249444533124861db90477fe5506e9eb6b5079910fb3e56f726"
    sha256 monterey:     "8347457cdbfb47b614c983aa0690b6088ce04b8d9ca8dacbeb418e686cbc6885"
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
