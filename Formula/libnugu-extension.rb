require_relative "../lib/GitHubPrivateRepositorySnapshotDownloadStrategy"

class LibnuguExtension < Formula
  desc "C/C++ library for NUGU SDK Extension"
  homepage "https://github.com/nugulinux/nugu-extension"
  # Use URL fragment to prevent brew audit failures for private repository.
  url "https://github.com/nugulinux/#nugu-extension/archive/145d9b9.tar.gz", using: GitHubPrivateRepositorySnapshotDownloadStrategy
  version "1.7.3"
  sha256 "2a3a1dcfbc893be5c122045a34fa83954b79209d333e42bdc9004e2dd98bb160"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/libnugu-extension-1.7.3"
    sha256 arm64_monterey: "b2a4c1316e4ec00552fc31fec97fc8a80031c4e74b1e6c29a302e7d2081c90b0"
    sha256 monterey:       "498fcf8b8e3484df363126b34f768e410507f3dca7af9668838199adb1e030e8"
    sha256 big_sur:        "35c12ddadc558a6acde9dc89fbcfac125800aa0113bc1d5c32d4fb2066fd6c40"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "libnugu"
  depends_on "sqlite3"

  def install
    args = %w[
      -DENABLE_LIBRARY_ONLY=ON
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
