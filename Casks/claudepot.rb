cask "claudepot" do
  version "0.7.3"

  on_arm do
    sha256 "5a682ee696bb9f919e2b540713b6e549290677b6a351bfa09749dd1edb1611c6"

    url "https://github.com/xiaolai/claudepot-app/releases/download/v#{version}/Claudepot-aarch64.dmg"
  end
  on_intel do
    sha256 "1a1fa7d74607c89dc12bdea74593dda81270781a26c1ad5b30aa9bf6c992c226"

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

  # No `depends_on macos:` on purpose. The app's floor is 10.15
  # (tauri.conf.json minimumSystemVersion), below the oldest
  # macOS Homebrew itself runs on, so a floor here can never
  # refuse anyone. Homebrew 7 made `:catalina` a hard error
  # ("disabled! There is no replacement") that broke every
  # command loading this cask, and each newer symbol is
  # scheduled to fail the same way when its support ends.
  # Add one back only if the app's floor rises above
  # Homebrew's.

  app "Claudepot.app"

  zap trash: [
    "~/.claudepot",
    "~/Library/Caches/com.claudepot.app",
    "~/Library/Preferences/com.claudepot.app.plist",
    "~/Library/Saved Application State/com.claudepot.app.savedState",
    "~/Library/WebKit/com.claudepot.app",
  ]
end
