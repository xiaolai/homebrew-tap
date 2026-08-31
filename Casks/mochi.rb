cask "mochi" do
  version "0.1.13"

  on_arm do
    sha256 "63e449021ac1c2564e073dc24f057bafd7997dbb8cbf12425ec75ad923e744dd"

    url "https://github.com/xiaolai/mochi/releases/download/v#{version}/Mochi-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "470b7aa023d80448091052a5ad0f38bd9b71dea3a33ea1c3392586f8af2142e0"

    url "https://github.com/xiaolai/mochi/releases/download/v#{version}/Mochi-#{version}-x64.dmg"
  end

  name "Mochi"
  desc "Desktop voice companion that listens and talks back in real time"
  homepage "https://github.com/xiaolai/mochi"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  # Electron 43 sets LSMinimumSystemVersion 12.0, so an older Mac
  # cannot open the app at all. Without this line `brew install`
  # would download 120MB and hand over something that refuses to
  # launch, with the reason only in Console.
  depends_on macos: :monterey

  app "Mochi.app"

  # Everything she is lives in the first of these: her characters,
  # their faces, their memory and every transcript. `zap` is opt-in
  # and means "leave no trace", so it belongs here — but it is the
  # difference between uninstalling the app and deleting her.
  zap trash: [
    "~/Library/Application Support/Mochi",
    "~/Library/Caches/com.mochi.companion",
    "~/Library/Preferences/com.mochi.companion.plist",
    "~/Library/Saved Application State/com.mochi.companion.savedState",
  ]
end
