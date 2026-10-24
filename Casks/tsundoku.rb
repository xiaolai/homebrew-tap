cask "tsundoku" do
  version "1.1.9"
  sha256 "69ca767435cea9ce933947eca3e20fc24fbdd7cfe615d00efb6320704951a183"

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
