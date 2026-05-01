class Claudepot < Formula
  desc "Multi-account Claude Code / Claude Desktop switcher (CLI)"
  homepage "https://github.com/xiaolai/claudepot-app"
  version "0.0.20"
  license "MIT"

  depends_on :linux

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/xiaolai/claudepot-app/releases/download/v#{version}/claudepot-aarch64-linux.tar.gz"
      sha256 "47ac313e1951ca27efb317d2d1dd15347c463d229d211f93922bd2d1e65a7fe6"
    else
      url "https://github.com/xiaolai/claudepot-app/releases/download/v#{version}/claudepot-x86_64-linux.tar.gz"
      sha256 "5d4d52d49a211a6d4a4f168f48162c3e428518ff8d1c95bed16fddd4456eba7f"
    end
  end

  def install
    bin.install "claudepot"
  end

  test do
    assert_match "Multi-account Claude Code", shell_output("#{bin}/claudepot --help")
  end
end
