cask "checkmate" do
  version "0.3.1"
  sha256 "7c84a98a3d5703b7898ea0c2ad019c083f04191957596ed452c64e17316a9650"

  url "https://github.com/xiaolai/checkmate/releases/download/v#{version}/Checkmate-#{version}.dmg"
  name "Checkmate"
  desc "Native chess practice and offline narrated lessons"
  homepage "https://github.com/xiaolai/checkmate"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  app "Checkmate.app"
end
