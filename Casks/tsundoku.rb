cask "tsundoku" do
  version "1.5.7"
  sha256 "01409226c1fd755e05ffb40b044a776a8060d63e67ea89355d18bb70b6c77ea7"

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
