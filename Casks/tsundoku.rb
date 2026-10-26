cask "tsundoku" do
  version "1.2.1"
  sha256 "dd2b643a388174812623212150a349bfaf016aef2ff3b6cd2f2f3ae4996cfb8c"

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
