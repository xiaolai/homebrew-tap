cask "uniplayer" do
  version "0.3.0"
  sha256 "f53751d1bd9d2fdc17eef243fc18830d35312773618328759e8fa5fd418fb9fd"

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
