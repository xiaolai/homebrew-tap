cask "checkmate" do
  version "0.3.6"
  sha256 "6207235083c949c7d971c96123bbfd1dc78c901047d747a3fc2ee3d3ad2bfd32"

  url "https://github.com/xiaolai/checkmate/releases/download/v#{version}/Checkmate-#{version}.dmg"
  name "Checkmate"
  desc "Native chess practice and offline narrated lessons"
  homepage "https://github.com/xiaolai/checkmate"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Checkmate.app"
end
