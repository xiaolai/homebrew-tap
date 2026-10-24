cask "uniplayer" do
  version "0.2.2"
  sha256 "307a2a58149dba209c5afbabfae051dbeb27a66a5ee7d754fb9d4b77df9d13a6"

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
