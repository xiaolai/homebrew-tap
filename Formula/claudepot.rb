class Claudepot < Formula
  desc "Multi-account Claude Code / Claude Desktop switcher (CLI)"
  homepage "https://claudepot.com/app/"
  version "0.2.4"
  license "MIT"

  depends_on :linux

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/xiaolai/claudepot-app/releases/download/v#{version}/claudepot-aarch64-linux.tar.gz"
      sha256 "fecea633351c834cba720bcda444d1272ccb45142aefa4817d607dc0caea8773"
    else
      url "https://github.com/xiaolai/claudepot-app/releases/download/v#{version}/claudepot-x86_64-linux.tar.gz"
      sha256 "c3f2f8ddd789a80a27dec368b404aa5e3bb9f9b3f8c877658ac2545a7b8ddcad"
    end
  end

  def install
    bin.install "claudepot"
  end

  test do
    assert_match "Multi-account Claude Code", shell_output("#{bin}/claudepot --help")
  end
end
