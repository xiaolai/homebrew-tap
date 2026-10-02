class Claudepot < Formula
  desc "Multi-account Claude Code / Claude Desktop switcher (CLI)"
  homepage "https://claudepot.com/app/"
  version "0.6.7"
  license "MIT"

  # url/sha256 MUST be set at the top level, not inside an
  # `on_linux do` block. Homebrew evaluates the formula DSL at
  # LOAD time on every platform and requires a url
  # unconditionally — with the stanzas nested in `on_linux`,
  # loading on macOS raised
  #   "claudepot: formula requires at least a URL"
  # and every `brew` command touching the bare name
  # `claudepot` printed that error before falling through to
  # the cask. `Hardware::CPU.arm?` evaluates fine on macOS, so
  # the conditional is safe here; `depends_on :linux` is what
  # actually prevents installing it on a Mac.
  if Hardware::CPU.arm?
    url "https://github.com/xiaolai/claudepot-app/releases/download/v#{version}/claudepot-aarch64-linux.tar.gz"
    sha256 "08862889a4b8a8fb9310632e3d3e8746b3656f0bf3aebe7658efeb4330833899"
  else
    url "https://github.com/xiaolai/claudepot-app/releases/download/v#{version}/claudepot-x86_64-linux.tar.gz"
    sha256 "ea7f999302c50ba0545499adae94ed2f98dd332af29c8108b449b1b83055a86a"
  end

  depends_on :linux

  def install
    bin.install "claudepot"
  end

  test do
    assert_match "Multi-account Claude Code", shell_output("#{bin}/claudepot --help")
  end
end
