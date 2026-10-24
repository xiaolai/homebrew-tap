cask "uniplayer" do
  version "0.2.0"
  sha256 "1dab96bcc5af1e09c9b7b65aecc78dcef970596f551e1115c428b55f3f488fef"

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
