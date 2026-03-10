class Mecha < Formula
  desc "Run an army of Claude Code bots on your machines"
  homepage "https://mecha.im"
  version "0.2.5"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-darwin-arm64.tar.gz"
      sha256 "aee37a95e339bfd1ea190175cd2c79f10d32a9f9d5fb3d765dad34b0b87b298e"
    else
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-darwin-x64.tar.gz"
      sha256 "594e00baa82d122772f412b3f0872e93b7a91778efa627096a6b3508682953e8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-linux-arm64.tar.gz"
      sha256 "d3af35043d9f8e128cf4f15060f67445a182fbe6879dcfc5b5bdfcb1df62695c"
    else
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-linux-x64.tar.gz"
      sha256 "455fe81b86ebe6c02e62241030f12f386b8d18964c719c45fe0d88fdc65fc289"
    end
  end

  def install
    bin.install "mecha"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mecha --version")
  end
end
