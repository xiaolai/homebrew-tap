cask "claudepot" do
  version "0.4.5"

  on_arm do
    sha256 "15b94e31267c135e4f8d73395883f2f6f0895305676137ac907e371b9ad0c180"

    url "https://github.com/xiaolai/claudepot-app/releases/download/v#{version}/Claudepot-aarch64.dmg"
  end
  on_intel do
    sha256 "c086cfb1916b53a20d5bbe80a47d09abeb6fbada0bdc7502df3168afa68f1b74"

    url "https://github.com/xiaolai/claudepot-app/releases/download/v#{version}/Claudepot-x86_64.dmg"
  end

  binary "#{appdir}/Claudepot.app/Contents/MacOS/claudepot-cli",
         target: "claudepot"

  name "Claudepot"
  desc "Multi-account Claude Code / Claude Desktop switcher"
  homepage "https://claudepot.com/app/"

  # The app self-updates in place (Settings → About), so the
  # Caskroom version goes stale by design. auto_updates makes
  # plain 'brew upgrade' skip the cask (only --greedy
  # reinstalls), so brew can't downgrade a self-updated app
  # when the tap lags a release.
  auto_updates true

  livecheck do
    url "https://github.com/xiaolai/claudepot-app"
    strategy :github_latest
  end

  # Symbol form, not the string ">= :catalina". Homebrew
  # deprecated string comparison for `depends_on macos:` and
  # warns on every command that loads the cask; the bare symbol
  # already means "this version or newer".
  depends_on macos: :catalina

  app "Claudepot.app"

  zap trash: [
    "~/.claudepot",
    "~/Library/Caches/com.claudepot.app",
    "~/Library/Preferences/com.claudepot.app.plist",
    "~/Library/Saved Application State/com.claudepot.app.savedState",
    "~/Library/WebKit/com.claudepot.app",
  ]
end
