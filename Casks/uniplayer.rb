cask "uniplayer" do
  version "0.2.1"
  sha256 "4e05010e3400613a410ad715dc6d9ed9698584cd3e0e446c6fade8a72c2e4564"

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
