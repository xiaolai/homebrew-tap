cask "uniplayer" do
  version "0.1.7"
  sha256 "e9d519ddb1ddd756e34ad5f2672c1954d38f16b4d8feda7fe6722e14f99e0444"

  url "https://github.com/xiaolai/uniplayer/releases/download/v#{version}/UniPlayer-#{version}-universal.dmg"
  name "UniPlayer"
  desc "Video player with a library, channels, and inline playback"
  homepage "https://github.com/xiaolai/uniplayer"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on macos: :golden_gate

  app "UniPlayer.app"
end
