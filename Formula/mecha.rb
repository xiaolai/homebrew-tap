class Mecha < Formula
  desc "Run an army of Claude Code bots on your machines"
  homepage "https://mecha.im"
  version "0.2.1"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-darwin-arm64.tar.gz"
      sha256 "f48aa90987df2e9abcd2dcee37d4bd50bf55e904eb6ffac6b04b5dd418a89b4a"
    else
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-darwin-x64.tar.gz"
      sha256 "116cfc4891da1a9c9ecd2d4cc755aba2784553a12ed4bc37f589f72e0bc55b3b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-linux-arm64.tar.gz"
      sha256 "ac850de7f7ddc50565ec466a5d3fdbfc3d7d04bc42a544224e4d4c17a8a3fb5b"
    else
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-linux-x64.tar.gz"
      sha256 "d5dfb13f2f0969efb1efacac89128e5b9db7d3953ee91b954df34c08f05fe505"
    end
  end

  def install
    bin.install "mecha"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mecha --version")
  end
end
