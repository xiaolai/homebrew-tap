class Claudepot < Formula
  desc "Multi-account Claude Code / Claude Desktop switcher (CLI)"
  homepage "https://claudepot.com/app/"
  version "0.4.2"
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
    sha256 "db89fd3a112dd9b9af3e5df782c963d7f60c993196cdaebf0edf63e373082b14"
  else
    url "https://github.com/xiaolai/claudepot-app/releases/download/v#{version}/claudepot-x86_64-linux.tar.gz"
    sha256 "01e86b23e515732e23d1d49341c66a6fb86742ecef9644a25bdba4b765c3fb76"
  end

  depends_on :linux

  def install
    bin.install "claudepot"
  end

  test do
    assert_match "Multi-account Claude Code", shell_output("#{bin}/claudepot --help")
  end
end
