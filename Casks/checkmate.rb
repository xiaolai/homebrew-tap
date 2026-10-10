cask "checkmate" do
  version "0.3.5"
  sha256 "e5d16b831f781f439f62ace6c4ca55c1ef274ab24f81f25062ab17683ad11c50"

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
