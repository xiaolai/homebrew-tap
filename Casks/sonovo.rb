cask "sonovo" do
  version "0.9.0"
  sha256 "d4953559cfe34517b940bd7dd77718a2f798abb44b467bddc29965e54d5262d1"

  url "https://github.com/xiaolai/sonovo/releases/download/v#{version}/Sonovo-#{version}.dmg"
  name "Sonovo"
  desc "Personal macOS workspace for media, documents, and tmux terminals"
  homepage "https://github.com/xiaolai/sonovo"

  livecheck do
    url "https://github.com/xiaolai/sonovo"
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  app "Sonovo.app"

  zap trash: [
    "~/Library/Application Support/Sonovo",
    "~/Library/Caches/com.lixiaolai.sonovo",
    "~/Library/HTTPStorages/com.lixiaolai.sonovo",
    "~/Library/Preferences/com.lixiaolai.sonovo.plist",
    "~/Library/Saved Application State/com.lixiaolai.sonovo.savedState",
    "~/Library/WebKit/com.lixiaolai.sonovo",
  ]
end
