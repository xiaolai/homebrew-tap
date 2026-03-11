class Mecha < Formula
  desc "Run an army of Claude Code bots on your machines"
  homepage "https://mecha.im"
  version "0.2.17"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-darwin-arm64.tar.gz"
      sha256 "432384746cbf56085832964457438cebf210a5d4d17f55b31b7055fb33e02112"
    else
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-darwin-x64.tar.gz"
      sha256 "1ffe24b143d50f3819879e70d9566c665173ca656e9258aa50a1151890165e18"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-linux-arm64.tar.gz"
      sha256 "57044570395ad629ee156209b610b8276982c2e77e7e9e539298f1f0c0a12bd6"
    else
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-linux-x64.tar.gz"
      sha256 "ac88cae333424d41773d208064d96aaae0a2ee9dee2594f9c2c8100262f85e3b"
    end
  end

  def install
    bin.install "mecha"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mecha --version")
  end
end
