cask "tsundoku" do
  version "1.3.0"
  sha256 "eaf5902a492ff0586ca89457b14e7b4b8bc1962b516fd7a527b46bcead90ca3e"

  url "https://github.com/xiaolai/tsundoku/releases/download/v#{version}/Tsundoku-#{version}.dmg"
  name "Tsundoku"
  desc "Local Kindle and Apple Books annotations, history, export and AI"
  homepage "https://github.com/xiaolai/tsundoku"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia
  app "Tsundoku.app"
end
