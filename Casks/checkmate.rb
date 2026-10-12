cask "checkmate" do
  version "0.6.0"
  sha256 "fa9098c802c84ead82ada6460c9821217dce143fc8ab52b6cb8adc6745d892bc"

  url "https://github.com/xiaolai/checkmate/releases/download/v#{version}/Checkmate-#{version}.dmg"
  name "Checkmate"
  desc "Native chess practice and offline narrated lessons"
  homepage "https://github.com/xiaolai/checkmate"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Checkmate.app"

  zap trash: [
    "~/Library/Application Support/ai.xiaolai.checkmate",
    "~/.codex/skills/checkmate-companion",
  ]
end
