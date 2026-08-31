cask "mochi" do
  version "0.1.8"

  on_arm do
    sha256 "9d6fae5f19580185469c823d5828d81ce4a42ae1d0b1c48e4d1b48c2e5e79ecf"

    url "https://github.com/xiaolai/mochi/releases/download/v#{version}/Mochi-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "ae89b573be2ba23d6607bce2f09df194233e55bd3f12c60b8e250452078ac13b"

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
