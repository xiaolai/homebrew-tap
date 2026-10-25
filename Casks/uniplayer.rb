cask "uniplayer" do
  version "0.2.10"
  sha256 "fa559b85f2b5becbe6931bfe282d03261929f830eb0b12106de858fde37789b5"

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
