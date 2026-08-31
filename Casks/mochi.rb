cask "mochi" do
  version "0.1.10"

  on_arm do
    sha256 "872878b13f06f329030857eb6eb05e725079d61a63516e62961436e0116aa737"

    url "https://github.com/xiaolai/mochi/releases/download/v#{version}/Mochi-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "450929a9f732bf29b4f24feaaabd3e4398753071709db0ee1d9ee554376b7274"

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
