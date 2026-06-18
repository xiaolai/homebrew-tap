class Claudepot < Formula
  desc "Multi-account Claude Code / Claude Desktop switcher (CLI)"
  homepage "https://claudepot.com/app/"
  version "0.1.50"
  license "MIT"

  depends_on :linux

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/xiaolai/claudepot-app/releases/download/v#{version}/claudepot-aarch64-linux.tar.gz"
      sha256 "f58a7b8f1ea132c42f294cafadd1e67d3c0f52e1e84a5121b90107ecf0930564"
    else
      url "https://github.com/xiaolai/claudepot-app/releases/download/v#{version}/claudepot-x86_64-linux.tar.gz"
      sha256 "4f352a82a2d0a1aa7801922687aae2a1538a2064f65416faaaffdd46538bc946"
    end
  end

  def install
    bin.install "claudepot"
  end

  test do
    assert_match "Multi-account Claude Code", shell_output("#{bin}/claudepot --help")
  end
end
