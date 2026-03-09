class Mecha < Formula
  desc "Run an army of Claude Code bots on your machines"
  homepage "https://mecha.im"
  version "0.2.2"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-darwin-arm64.tar.gz"
      sha256 "7a963d6a5ae901ccf339e8c7ebe303eee40570b930ae029ed1b447ed384d7f3f"
    else
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-darwin-x64.tar.gz"
      sha256 "13de494dc25caf165028c4bda6a8da2b519b678c7e569b9ef40ec2d6806c36e0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-linux-arm64.tar.gz"
      sha256 "a9d526ce896621b666cafad6ceb267be41ebee261b108b6caaa7cb3be320bfe3"
    else
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-linux-x64.tar.gz"
      sha256 "5c9f50b519646d6a271eae517a097c8503ddd49416662edebf68ae1426a9fb48"
    end
  end

  def install
    bin.install "mecha"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mecha --version")
  end
end
