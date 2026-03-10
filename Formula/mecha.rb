class Mecha < Formula
  desc "Run an army of Claude Code bots on your machines"
  homepage "https://mecha.im"
  version "0.2.7"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-darwin-arm64.tar.gz"
      sha256 "736b55bfed5fa5c2fe4eec9f077c288fb6921a194faac728f5f1a6d54dfcd71e"
    else
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-darwin-x64.tar.gz"
      sha256 "95358e7c1671a8d14c37c62ea0874dac3a05e177cf0dc6c3c1b30752929f14e2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-linux-arm64.tar.gz"
      sha256 "12e82655604b69ecb502ba3adf80e7c3ee1e1d13efb3bf41a62a101fea2e86c8"
    else
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-linux-x64.tar.gz"
      sha256 "552582cd1767a7709d8f76d08cc72dc18b9adabca8616e751c74abb487555133"
    end
  end

  def install
    bin.install "mecha"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mecha --version")
  end
end
