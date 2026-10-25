cask "uniplayer" do
  version "0.3.1"
  sha256 "f0802fe17341dcc0508ec0861292f33a91d8b05274f633a77d96be7915560dfe"

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
