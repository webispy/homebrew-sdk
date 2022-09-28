class LibnuguExamples < Formula
  desc "Example applications for NUGU SDK"
  homepage "https://github.com/nugu-developers/nugu-linux"
  url "https://github.com/nugu-developers/nugu-linux/archive/cac6425.tar.gz"
  version "1.7.3"
  sha256 "b19cc823732cf7ebecffc792e99d400b3173dc8b1fa1f28f7c112d5ede5b03f5"
  license "Apache-2.0"

  # brew install --build-from-source --HEAD libnugu
  head "https://github.com/nugu-developers/nugu-linux.git", branch: "master"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/libnugu-examples-1.7.3"
    rebuild 2
    sha256 cellar: :any, arm64_monterey: "185c6da6394b6fcce5d94db5b554e865c867b81db5f76e8c11b8c0ee5e120ddc"
    sha256 cellar: :any, monterey:       "94b46fba4203af2caa22d5d5f7e55b4ccbefdee43e4a7dcbdc82f514be31038b"
    sha256 cellar: :any, big_sur:        "43a1f7ce21118878b2566c272bff56631eafc4348cfb5a0536afaf1b5810657a"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "libnugu"
  depends_on "libnugu-plugins"

  def install
    args = %W[
      -DENABLE_EXAMPLES_ONLY=ON
      -DPACKAGING=ON
      -DASSET_DIR=#{Formula["libnugu"].share}/nugu
    ]

    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "true"
  end
end
