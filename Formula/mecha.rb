class Mecha < Formula
  desc "Event-driven agentic workflow engine"
  homepage "https://mecha.im"
  version "0.5.10"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-darwin-arm64.tar.gz"
      sha256 "15e74ea6a80d3100606e0c9f24d86e12197ce9b1b3648cbbede11c4cdd91d4bb"
    else
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-darwin-amd64.tar.gz"
      sha256 "f7c06066327f4c9dfdfcf7497d7391ecc9e7df01d6da23a193be6030374969ac"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-linux-arm64.tar.gz"
      sha256 "c91e3afc44bb09f572e660a8aae367aae6626086781434473b602b93887408f3"
    else
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-linux-amd64.tar.gz"
      sha256 "f9255a6d75d72be554235a0052fd90713e58b7b86a246db1d4018b4e49fb02cc"
    end
  end

  def install
    bin.install "mecha"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mecha version")
  end
end
