cask "checkmate" do
  version "0.3.0"
  sha256 "c130607252ac078f6313900591655d1fbeb6deacd8554cf3a6444a0bc6d08a00"

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
