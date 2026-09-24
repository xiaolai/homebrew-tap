cask "vmark" do
  version "0.9.84"

  on_arm do
    sha256 "f6be583071d6cc22dced4ac620a72d02f551767b5d9e44af27008c3053f4c1de"
    url "https://github.com/xiaolai/vmark/releases/download/v#{version}/VMark_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "2d7c9f948bacbf67ab452030f6ea1a988dbc5a253508a0d6ba8804270d9e68ec"
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
