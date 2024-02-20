class Armv7UnknownLinuxMusleabihf < Formula
  desc "armv7 Linux MUSL eabihf Toolchain"
  homepage "https://github.com/haohaolee/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "13.2.0"

  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.11"

  if Hardware::CPU.arm?
    url "https://github.com/haohaolee/homebrew-macos-cross-toolchains/releases/download/v13.2.0/armv7-unknown-linux-musleabihf-aarch64-darwin.tar.gz"
    sha256 "39917d32706c07d5b648263c73279ca8171b6d9d0288f678aed1d7e705d7deb1"
  else
    url "https://github.com/haohaolee/homebrew-macos-cross-toolchains/releases/download/v13.2.0/armv7-unknown-linux-musleabihf-x86_64-darwin.tar.gz"
    sha256 "75dba4f7844bd039cb84bec1a2aceed52bd0eed50462113fbc10401a6be3c2d8"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
