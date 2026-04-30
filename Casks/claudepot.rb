cask "claudepot" do
  version "0.0.13"

  on_arm do
    sha256 "c2e94ac0d178646bed37bde3b76aaf7e81e9f224a2d93e5df2ac7cc03cbf5038"

    url "https://github.com/xiaolai/claudepot-app/releases/download/v#{version}/Claudepot-aarch64.dmg"
  end
  on_intel do
    sha256 "7228e14ed13b7f670ecefab72fa670c4babd27a67e924c6855471766f0c210bc"

    url "https://github.com/xiaolai/claudepot-app/releases/download/v#{version}/Claudepot-x86_64.dmg"
  end

  binary "#{appdir}/Claudepot.app/Contents/MacOS/claudepot-cli",
         target: "claudepot"

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
