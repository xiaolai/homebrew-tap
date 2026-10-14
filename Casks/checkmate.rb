cask "checkmate" do
  version "0.7.5"
  sha256 "c8f6cc9e926cfd0dfdae409fc531d71eab04271cb1c3cb9e857a862cb52d05fa"

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
