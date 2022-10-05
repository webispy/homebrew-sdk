class LibnuguExtensionSample < Formula
  desc "Sample applications for NUGU Extension SDK"
  homepage "https://github.com/nugulinux/nugu-examples"
  url "https://github.com/nugulinux/nugu-examples/archive/264226c.tar.gz"
  version "1.7.3"
  sha256 "39d02ca3b8ddf5743b50deee7bb17eb83b0b40c281e9edc1093bb9bce8fc0d50"
  license "Apache-2.0"

  # brew install --build-from-source --HEAD libnugu-extension-sample
  head "https://github.com/nugulinux/nugu-examples.git", branch: "master"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/libnugu-extension-sample-1.7.3"
    sha256 cellar: :any, arm64_monterey: "7cf44a3ddda6ea804023e162a9f9a66abf3be01b16ab4cf244f4d38a9b4be65b"
    sha256 cellar: :any, monterey:       "98c73687792305b09dec5b424da3f6335c963fd7e25eb14ba26467a89af1b1df"
    sha256 cellar: :any, big_sur:        "f3173d4d2112768946f80c72f06540f37a413d8194f50bba206d59098f67324a"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "libnugu-extension"
  depends_on "libnugu-plugins"

  def install
    args = %w[
      -DENABLE_NUGU_EXTENSION_SAMPLE=ON
      -DENABLE_NUGU_GUI_SAMPLE=OFF
    ]

    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "true"
  end
end
