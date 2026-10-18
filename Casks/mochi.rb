cask "mochi" do
  version "0.9.12"
  sha256 "ac1f6badd033d36ef42ebf65b9eae8bda3273eeaf47df2a4de00cfbaed3b6bee"

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
