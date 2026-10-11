cask "mochi" do
  version "0.6.2"
  sha256 "4b0197d3bf7f56d31f72b2961c640dafbe0f5bc5075cd55c67d9acabe78acd75"

  url "https://github.com/xiaolai/mochi-macOS/releases/download/v#{version}/Mochi-#{version}.dmg"
  name "Mochi"
  desc "English conversation and voice practice companion"
  homepage "https://github.com/xiaolai/mochi-macOS"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  # Install by the full xiaolai/tap/mochi name. Homebrew's Caskroom is token-keyed,
  # so conflicts_with the other mochi would also block this cask's own upgrades.
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Mochi.app"

  uninstall quit: "com.lixiaolai.mochi-macos"

  # Preserve conversations, practice audio, credentials, and the legacy data folder.
  # No zap stanza until shared Application Support/Mochi ownership is resolved.
end
