cask "vmark" do
  version "0.9.86"

  on_arm do
    sha256 "b1961c8b31a7ff13a3467aa9f268ee55ca890c96c509b2c842447374bbb3e178"
    url "https://github.com/xiaolai/vmark/releases/download/v#{version}/VMark_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "64478eb36bcecac7936476b82303c2b6ab433db1d20cdbcbecf0f2d5920b6178"
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
