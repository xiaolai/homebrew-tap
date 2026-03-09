class Mecha < Formula
  desc "Run an army of Claude Code bots on your machines"
  homepage "https://mecha.im"
  version "0.2.4"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-darwin-arm64.tar.gz"
      sha256 "9206ef5e14586fb0133d184d8e0c32c93056c1193256209b692a8f89c952a9bd"
    else
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-darwin-x64.tar.gz"
      sha256 "d36d5de889734fa49849dbf4215b6a5ce32d07bb4bc9c677aaf66fcd8e5acb3a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-linux-arm64.tar.gz"
      sha256 "9ae7f44d63ba07922fb147ef5cafc12e23dbb9f3d58de85df3bfd7fad3b5314f"
    else
      url "https://github.com/xiaolai/mecha.im/releases/download/v#{version}/mecha-linux-x64.tar.gz"
      sha256 "c3df845ef34b3e3b317b939a3143417b2e8f747bff1ac6f068bda7d4d1d6129c"
    end
  end

  def install
    bin.install "mecha"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mecha --version")
  end
end
