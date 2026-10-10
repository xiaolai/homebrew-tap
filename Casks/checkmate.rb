cask "checkmate" do
  version "0.3.3"
  sha256 "809339de3c98938fb5fc0904ce61c28f4daa5671977af0d2e9cfedff92371955"

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
