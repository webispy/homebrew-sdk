require_relative "../lib/GitHubPrivateRepositorySnapshotDownloadStrategy"

class LibnuguExtension < Formula
  desc "C/C++ library for NUGU SDK Extension"
  homepage "https://github.com/nugulinux/nugu-extension"
  # Use URL fragment to prevent brew audit failures for private repository.
  url "https://github.com/webispy/#nugu-extension/archive/refs/tags/v1.7.6.tar.gz", using: GitHubPrivateRepositorySnapshotDownloadStrategy
  sha256 "54f7489a1ea330f2b16ae792a934861303601e59bd3b39893deff46aabc117a8"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/libnugu-extension-1.7.6"
    sha256 arm64_sonoma: "640c132cc6b8216acf011c12c30ff3927d0f71d9cbf91e28eddef50dee4d8080"
    sha256 ventura:      "ade51f98f057e4019a2cb875d463dc44d42177f79f5f1c3776969cd33b05d738"
    sha256 monterey:     "1727d881b0d34cf5d49e74dbaa919d9e46dda778250be8ec1e78a1def00f456e"
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
