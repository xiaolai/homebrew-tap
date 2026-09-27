class Claudepot < Formula
  desc "Multi-account Claude Code / Claude Desktop switcher (CLI)"
  homepage "https://claudepot.com/app/"
  # A constant, not a `version` stanza: the URLs below are built from it, and
  # `brew audit` rejects a `version` whose value it can already scan out of the
  # interpolated URL. Brew derives the version from the URL instead, so this
  # stays the single place to bump.
  VERSION = "0.6.6".freeze
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
    url "https://github.com/xiaolai/claudepot-app/releases/download/v#{VERSION}/claudepot-aarch64-linux.tar.gz"
    sha256 "5a309b38d6085b0ed80bbc64b1630653e053a5c9e78decf51f7acc62d4227a08"
  else
    url "https://github.com/xiaolai/claudepot-app/releases/download/v#{VERSION}/claudepot-x86_64-linux.tar.gz"
    sha256 "b0efa314e196dd7752b3fd97e14618ef9fa537661d317fc7d5ed5daaf93fbc6a"
  end

  depends_on :linux

  def install
    bin.install "claudepot"
  end

  test do
    assert_match "Multi-account Claude Code", shell_output("#{bin}/claudepot --help")
  end
end
