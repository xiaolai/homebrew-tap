cask "claudepot" do
  version "0.1.50"

  on_arm do
    sha256 "5eace57afcc72f0da934970dfdd74bd7cf1b23574bd638693fba0677fa1109bf"

    url "https://github.com/xiaolai/claudepot-app/releases/download/v#{version}/Claudepot-aarch64.dmg"
  end
  on_intel do
    sha256 "b5ff5cce33187bd8f67ba13e283b2c7f71cde6dee869a0c92569e22037e911e0"

    url "https://github.com/xiaolai/claudepot-app/releases/download/v#{version}/Claudepot-x86_64.dmg"
  end

  name "Claudepot"
  desc "Multi-account Claude Code / Claude Desktop switcher"
  homepage "https://claudepot.com/app/"

  livecheck do
    url "https://github.com/xiaolai/claudepot-app"
    strategy :github_latest
  end

  # The app self-updates in place (Settings → About), so the
  # Caskroom version goes stale by design. auto_updates makes
  # plain 'brew upgrade' skip the cask (only --greedy
  # reinstalls), so brew can't downgrade a self-updated app
  # when the tap lags a release.
  auto_updates true
  depends_on macos: :catalina

  app "Claudepot.app"
  binary "#{appdir}/Claudepot.app/Contents/MacOS/claudepot-cli",
         target: "claudepot"

  zap trash: [
    "~/.claudepot",
    "~/Library/Caches/com.claudepot.app",
    "~/Library/Preferences/com.claudepot.app.plist",
    "~/Library/Saved Application State/com.claudepot.app.savedState",
    "~/Library/WebKit/com.claudepot.app",
  ]
end
