cask "checkmate" do
  version "0.6.2"
  sha256 "950928869b09ce27c127acfcdc120ec9b091ca3880ff9f5e494db5b88c903a4f"

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
