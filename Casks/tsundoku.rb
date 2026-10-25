cask "tsundoku" do
  version "1.1.11"
  sha256 "367c4151eb8de6616cde56ac003028e26a20cc13fe15345dcd04dc37bf62d05d"

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
