class LibnuguExtensionSample < Formula
  desc "Sample applications for NUGU Extension SDK"
  homepage "https://github.com/nugulinux/nugu-examples"
  url "https://github.com/nugulinux/nugu-examples/archive/264226c.tar.gz"
  version "1.7.3"
  sha256 "39d02ca3b8ddf5743b50deee7bb17eb83b0b40c281e9edc1093bb9bce8fc0d50"
  license "Apache-2.0"

  # brew install --build-from-source --HEAD libnugu-extension-sample
  head "https://github.com/nugulinux/nugu-examples.git", branch: "master"

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
