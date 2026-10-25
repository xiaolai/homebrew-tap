cask "checkmate" do
  version "0.9.2"
  sha256 "db5e30a575f2644e227ca43975c9ee852fe9265cba8d21f272c670b38aa881e6"

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
