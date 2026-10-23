cask "uniplayer" do
  version "0.1.6"
  sha256 "bd1d5ab70b53592ade8f04df0a7c478ce81a933f1f4b67942697984bd1225a9f"

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
