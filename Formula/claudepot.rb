class Claudepot < Formula
  desc "Multi-account Claude Code / Claude Desktop switcher (CLI)"
  homepage "https://claudepot.com/app/"
  version "0.5.8"
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
    sha256 "a010642810129880e8a35914fd77e63084d30664f562838c3dc6668a04085694"
  else
    url "https://github.com/xiaolai/claudepot-app/releases/download/v#{version}/claudepot-x86_64-linux.tar.gz"
    sha256 "e3fc1c3044b44231620b0edbe3152393ee9fab563591dcad142af06dc8747059"
  end

  depends_on :linux

  def install
    bin.install "claudepot"
  end

  test do
    assert_match "Multi-account Claude Code", shell_output("#{bin}/claudepot --help")
  end
end
