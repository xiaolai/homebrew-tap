cask "xdict" do
  version "0.2.0"
  sha256 "8d838987fbd4d059674238ee337e740af16eb103c4e28c3accf753aa5a411271"

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
