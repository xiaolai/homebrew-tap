cask "checkmate" do
  version "0.3.2"
  sha256 "e4a58d3dd78d5513466501da80c7595c7966973a0bc353cbf904d7aee9ac9e44"

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
