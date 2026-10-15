cask "checkmate" do
  version "0.7.6"
  sha256 "1ebb288b99895e1c1301e7cdf0fbf160a688af02045fbb231d1737e7cc6444a3"

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
