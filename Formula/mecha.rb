class Mecha < Formula
  desc "Run an army of Claude Code bots on your machines"
  homepage "https://mecha.im"
  version "0.2.15"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-darwin-arm64.tar.gz"
      sha256 "9e889e8c178c4a9292eea3d4103adb063c2556f43b0820159062b3255a15bc26"
    else
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-darwin-x64.tar.gz"
      sha256 "17312b37b9c0cb569d457207e053078460abb933ff1c74e66090ba64d06af15a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-linux-arm64.tar.gz"
      sha256 "4eeeaaec39a1563e7f017be65e90e05c84d4f6ec8fbbaf7a15138502fe1e6473"
    else
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-linux-x64.tar.gz"
      sha256 "9d6bc2e021f8833fab51ef22843162d00b60092620fb4d4467fd2aefc85a9960"
    end
  end

  def install
    bin.install "mecha"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mecha --version")
  end
end
