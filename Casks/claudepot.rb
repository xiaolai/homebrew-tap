cask "claudepot" do
  version "0.0.8"

  on_arm do
    sha256 "ec324a97fd4fd07d3dbe5b549a93af213902eb76b0b5c1c5765f00e004c4fdde"

    url "https://github.com/xiaolai/claudepot-app/releases/download/v#{version}/Claudepot-aarch64.dmg"

    binary "#{appdir}/Claudepot.app/Contents/MacOS/claudepot-cli-aarch64-apple-darwin",
           target: "claudepot"
  end
  on_intel do
    sha256 "02b66222545acfeafee6b096cdc5f5dc7086886653439e23b172028839487371"

    url "https://github.com/xiaolai/claudepot-app/releases/download/v#{version}/Claudepot-x86_64.dmg"

    binary "#{appdir}/Claudepot.app/Contents/MacOS/claudepot-cli-x86_64-apple-darwin",
           target: "claudepot"
  end

  name "Claudepot"
  desc "Multi-account Claude Code / Claude Desktop switcher"
  homepage "https://github.com/xiaolai/claudepot-app"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on macos: ">= :catalina"

  app "Claudepot.app"

  zap trash: [
    "~/.claudepot",
    "~/Library/Caches/com.claudepot.app",
    "~/Library/Preferences/com.claudepot.app.plist",
    "~/Library/Saved Application State/com.claudepot.app.savedState",
    "~/Library/WebKit/com.claudepot.app",
  ]
end
