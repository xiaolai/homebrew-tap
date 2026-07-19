class Claudepot < Formula
  desc "Multi-account Claude Code / Claude Desktop switcher (CLI)"
  homepage "https://claudepot.com/app/"
  version "0.2.6"
  license "MIT"

  depends_on :linux

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/xiaolai/claudepot-app/releases/download/v#{version}/claudepot-aarch64-linux.tar.gz"
      sha256 "6589efaebcae28bec89e402ba933fc272f9ba95e595091a6fe31172fcb551ce0"
    else
      url "https://github.com/xiaolai/claudepot-app/releases/download/v#{version}/claudepot-x86_64-linux.tar.gz"
      sha256 "83f9b3ac327087a748c499df3f2cc5a9fe6882280bcb7c1ccdb9b7e10a8198b1"
    end
  end

  def install
    bin.install "claudepot"
  end

  test do
    assert_match "Multi-account Claude Code", shell_output("#{bin}/claudepot --help")
  end
end
