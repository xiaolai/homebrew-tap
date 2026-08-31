cask "mochi" do
  version "0.1.11"

  on_arm do
    sha256 "31c6b0e18d6c2584480c5393db8d5e94b77c0d7a45e13620a7028deaa9802e3b"

    url "https://github.com/xiaolai/mochi/releases/download/v#{version}/Mochi-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "8ec4259720382c84ea294915d90a07ef7636cfbdf495bb1db85a98f5d37657ed"

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
