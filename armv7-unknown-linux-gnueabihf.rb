class Armv7UnknownLinuxGnueabihf < Formula
  desc "armv7 Linux GNU eabihf Toolchain"
  homepage "https://github.com/haohaolee/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "13.2.0"

  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.11"

  if Hardware::CPU.arm?
    url "https://github.com/haohaolee/homebrew-macos-cross-toolchains/releases/download/v13.2.0/armv7-unknown-linux-gnueabihf-aarch64-darwin.tar.gz"
    sha256 "f83c9d10079e3c9759f2d21f01efecb0257d920b3b267bcf2aada72a36e32472"
  else
    url "https://github.com/haohaolee/homebrew-macos-cross-toolchains/releases/download/v13.2.0/armv7-unknown-linux-gnueabihf-x86_64-darwin.tar.gz"
    sha256 "dd436176b33defd7f15387bc0900ec0357bce96812d1fef46d8a1395bacff965"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
