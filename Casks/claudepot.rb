cask "claudepot" do
  version "0.4.11"

  on_arm do
    sha256 "f88be0f5b5bbd33291c36962a8300b10ab03d44e39880fc3da008002316880e3"

    url "https://github.com/xiaolai/claudepot-app/releases/download/v#{version}/Claudepot-aarch64.dmg"
  end
  on_intel do
    sha256 "ce294f44283669b2c0a22e3f0ca680fbab20322b908e870c1b8e39539bf6ed59"

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
