cask "sonovo" do
  version "0.8.0"
  sha256 "4c15f7c118e6b7945ca7b45aa30e9f0841227ddff798c4c4a7683c25bec398ef"

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
