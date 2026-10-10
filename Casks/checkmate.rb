cask "checkmate" do
  version "0.3.4"
  sha256 "b7d8736ae3730747fc857e6f5fd4164807d58845d05b0c1a1638ac1f771d561b"

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
