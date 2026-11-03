cask "vmark" do
  version "0.9.114"

  on_arm do
    sha256 "b9cd981996e906267a32f0ccfab5c8ca99a90753d217722273379ac27e9eadc9"
    url "https://github.com/xiaolai/vmark/releases/download/v#{version}/VMark_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "9ade65bacf7cd024532ef1f8b43ce05484ad81afc08675bde6ca5d308250773c"
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
  # open with a readable message; this line keeps `brew install` from
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
