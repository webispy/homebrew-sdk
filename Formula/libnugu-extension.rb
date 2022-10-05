require_relative "../lib/GitHubPrivateRepositorySnapshotDownloadStrategy"

class LibnuguExtension < Formula
  desc "C/C++ library for NUGU SDK Extension"
  homepage "https://github.com/nugulinux/nugu-extension"
  # Use URL fragment to prevent brew audit failures for private repository.
  url "https://github.com/webispy/#nugu-extension/archive/331d4ec.tar.gz", using: GitHubPrivateRepositorySnapshotDownloadStrategy
  version "1.7.3"
  sha256 "f01669b78098735989e73dd518ed217d3084b35b9c6def828c7acb31882842e8"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/libnugu-extension-1.7.3"
    rebuild 2
    sha256 arm64_monterey: "2620c7e818aeff8ece5fbaa04e97cfdccafe757b86c27eb4bfc0498a8df484cf"
    sha256 monterey:       "b6aa8e7a9d46f9a3faa3b4c98682dbc0c777ea608b1ce9582c849ab065533eb4"
    sha256 big_sur:        "a683044eabb2a89b9add73839926b2360e37cb4f2865b34027684a15916d4e12"
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
