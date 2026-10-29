cask "tsundoku" do
  version "1.5.6"
  sha256 "c9640697963ca26a4d377b978abad7a2ccd696465dc21caa54500ae12191293b"

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
  uninstall quit: "com.lixiaolai.tsundoku"
end
