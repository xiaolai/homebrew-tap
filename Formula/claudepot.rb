class Claudepot < Formula
  desc "Multi-account Claude Code / Claude Desktop switcher (CLI)"
  homepage "https://claudepot.com/app/"
  version "0.3.1"
  license "MIT"

  depends_on :linux

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/xiaolai/claudepot-app/releases/download/v#{version}/claudepot-aarch64-linux.tar.gz"
      sha256 "9bdab875bf078d66c30810969cdc0b08525428b5f29057a8cb9f2c854dc34749"
    else
      url "https://github.com/xiaolai/claudepot-app/releases/download/v#{version}/claudepot-x86_64-linux.tar.gz"
      sha256 "636fde0e5a787f17283620045ef4caebcc66f4e078d754f08fb6094dc753943e"
    end
  end

  def install
    bin.install "claudepot"
  end

  test do
    assert_match "Multi-account Claude Code", shell_output("#{bin}/claudepot --help")
  end
end
