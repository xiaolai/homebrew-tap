cask "vmark" do
  version "0.9.90"

  on_arm do
    sha256 "669a42590b2786b91526493c66481bb91e7f5903d059597a892cb523a30323b8"
    url "https://github.com/xiaolai/vmark/releases/download/v#{version}/VMark_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "b494feee5ead70510ad7c408351e39dc16206c19310d9fb1174347f827a751c8"
    url "https://github.com/xiaolai/vmark/releases/download/v#{version}/VMark_#{version}_x64.dmg"
  end

  name "VMark"
  desc "Modern Markdown editor with WYSIWYG and source mode"
  homepage "https://github.com/xiaolai/vmark"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  # Homebrew can only express a MAJOR macOS version here, so this is
  # :ventura (13.0) while the real floor is 13.4 — see
  # scripts/check-webview-floor.mjs. The precise gate stays
  # LSMinimumSystemVersion from tauri.conf.json, which refuses to
  # open with a readable message; this line keeps  from
  # cheerfully installing onto Catalina, which it did until #1278.
  depends_on macos: :ventura

  app "VMark.app"

  zap trash: [
    "~/Library/Application Support/app.vmark",
    "~/Library/Caches/app.vmark",
    "~/Library/Preferences/app.vmark.plist",
    "~/Library/Saved Application State/app.vmark.savedState",
  ]
end
