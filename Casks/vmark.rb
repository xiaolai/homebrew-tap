cask "vmark" do
  version "1.0.3"

  on_arm do
    sha256 "375eb92f70ba6dbcc8bd8503149940aaec973b97e6d1d3f8730166cd790fce88"
    url "https://github.com/xiaolai/vmark/releases/download/v#{version}/VMark_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "3597df9e02c8c97c5db532c087d96ad8262412d73bee010541cbe66efd873826"
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
