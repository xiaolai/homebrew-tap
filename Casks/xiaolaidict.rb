cask "xiaolaidict" do
  version "0.0.5"
  sha256 "b6bdcb01837e90829c5e106913844957929575be6acc4169228c44542411b8df"

  url "https://github.com/xiaolai/XiaolaiDict/releases/download/v#{version}/XiaolaiDict-#{version}.dmg"
  name "XiaolaiDict"
  desc "Menu-bar dictionary that marks which sense of a word you just read"
  homepage "https://github.com/xiaolai/XiaolaiDict"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  # Apple Silicon only, and not merely untested on Intel: the model service links
  # MLX, which is Metal on Apple Silicon. `lipo -archs` on the shipped binary
  # reports arm64 alone.
  depends_on arch: :arm64
  # macOS 27 is the app's own floor, not a guess: Info.plist carries
  # LSMinimumSystemVersion 27.0, and build-bundle.sh pins MINIMUM_MACOS=27.0.
  # :golden_gate is Homebrew's symbol for 27 (Library/Homebrew/macos_version.rb).
  # The bare symbol reads as "exactly", and is not: the cask DSL hardcodes
  # `comparator: ">="` (cask/dsl/depends_on.rb), so this is 27 and newer.
  # `brew style` rewrites ">= :golden_gate" to this, so do not write it back.
  depends_on macos: :golden_gate

  app "XiaolaiDict.app"

  # Measured on a Mac that has run it, rather than assumed from convention. The
  # Application Support directory is the large one — the ledger lives there, and
  # so does any downloaded model, which is about 3 GB.
  zap trash: [
    "~/Library/Application Support/XiaolaiDict",
    "~/Library/Caches/com.xiaolaidict",
    "~/Library/Preferences/com.xiaolaidict.plist",
    "~/Library/Saved Application State/com.xiaolaidict.savedState",
  ]
end
