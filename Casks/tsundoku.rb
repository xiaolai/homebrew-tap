cask "tsundoku" do
  version "1.1.3"
  sha256 "77e78c9963daecc6c675f92ae7d79ce4ccdaa71ba26cc0af9121ec7ba5a565cd"

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
