cask "claudepot" do
  version "0.6.1"

  on_arm do
    sha256 "146b632caf0cda7c84712e8063b3dc62be77e5b1ee5377ebd22dfcf52aa6a256"

    url "https://github.com/xiaolai/claudepot-app/releases/download/v#{version}/Claudepot-aarch64.dmg"
  end
  on_intel do
    sha256 "49cd8cf30cd23b13a2ec80eddf14f864e7050975fa38670e05c855413bb91fb6"

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
