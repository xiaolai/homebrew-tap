cask "xdict" do
  version "0.3.0"
  sha256 "571c4d34a80012fcb84aa120dc00e320a0742be0cbd163c4775db1826f6148cc"

  url "https://github.com/xiaolai/xdict/releases/download/v#{version}/XDict-#{version}.dmg"
  name "XDict"
  desc "Menu-bar dictionary for the reader's own MDict (.mdx) files"
  homepage "https://xdict.ai"

  livecheck do
    url "https://github.com/xiaolai/xdict"
    strategy :github_latest
  end

  # Apple Silicon only, and not merely untested on Intel: `lipo -archs` on the shipped binary reports arm64 alone.
  depends_on arch: :arm64
  # macOS 27 is the app's own floor, not a guess: Info.plist carries LSMinimumSystemVersion 27.0.
  # :golden_gate is Homebrew's symbol for 27 (Library/Homebrew/macos_version.rb), and the cask DSL compares
  # with ">=" (cask/dsl/depends_on.rb), so this reads 27 and newer.
  depends_on macos: :golden_gate

  app "XDict.app"

  # Measured on a Mac that has run it, rather than assumed from convention: the library and the AI CLI homes live
  # in the app's Application Support; the sandboxed dictionary service's container and the group it shares with the
  # app hold staged conversions.
  zap trash: [
    "~/Library/Application Support/ai.xdict.app",
    "~/Library/Caches/ai.xdict.app",
    "~/Library/Containers/ai.xdict.app.DictionaryService",
    "~/Library/Group Containers/Y53RSUA3SM.ai.xdict.app",
    "~/Library/Preferences/ai.xdict.app.plist",
    "~/Library/Saved Application State/ai.xdict.app.savedState",
  ]
end
