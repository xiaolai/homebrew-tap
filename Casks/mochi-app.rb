cask "mochi-app" do
  version "0.1.18"

  on_arm do
    sha256 "607caa14d134b4de5e4f08098f379e828d275ada77ba8929f001024470208396"

    url "https://github.com/xiaolai/mochi/releases/download/v#{version}/Mochi-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "8cb7f3325619623d3d0dbfa94417766a91e1b018d3cfcd5b0f5673bf8bac9904"

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
