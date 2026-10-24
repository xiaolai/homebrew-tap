cask "uniplayer" do
  version "0.2.4"
  sha256 "04a83a26aae632fe7194dc3f7cd76858202de2c304592b6e428c3b56494b5e08"

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
  app "UniPlayer HUD.app"
end
