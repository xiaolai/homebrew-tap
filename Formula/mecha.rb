class Mecha < Formula
  desc "Agentic workflow engine for LLM tasks"
  homepage "https://mecha.im"
  version "0.5.19"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-darwin-arm64.tar.gz"
      sha256 "4e06d0787db0d73dc9223618e41fe7ff8495a5f43abc7ad5c5af9cc58c77b780"
    else
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-darwin-amd64.tar.gz"
      sha256 "dc97eacafcfe99a43171cb0f1500d540dd9c154cc8034fedae39b020c237cc46"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-linux-arm64.tar.gz"
      sha256 "9b8cb7af5c3dc0b668a3927a961f5ed36cdca5dc8563f21e4c91dd6129198f60"
    else
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-linux-amd64.tar.gz"
      sha256 "12a79cfb8510533b174ea27ca82e7f7d84311a9d628b7a41f83b336f72a7c28a"
    end
  end

  def install
    bin.install "mecha"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mecha version")
  end
end
