cask "tsundoku" do
  version "1.2.0"
  sha256 "ebb1f738be04c8c455fcfadacdaba0cd45618e3e16701ef60b2d6b1aed610255"

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
