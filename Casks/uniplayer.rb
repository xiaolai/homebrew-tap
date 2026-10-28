cask "uniplayer" do
  version "0.3.4"
  sha256 "4e5add38a0a0b231b08a4c5be0f51f5aa67b0e942113c275cc4ef27ba9b9ed6c"

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
