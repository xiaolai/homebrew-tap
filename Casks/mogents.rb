cask "mogents" do
  version "0.7.4"
  sha256 "223becacc210f9d1a7df1997d7b8ad50c9a8cc84f41d12dc08fec94cd174bbe9"

  url "https://github.com/xiaolai/mogents-ai/releases/download/v#{version}/mogents-#{version}-macos-universal.zip"
  name "Mogents"
  desc "Chat workspace for persistent tmux agents with a local host helper"
  homepage "https://github.com/xiaolai/mogents-ai"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on formula: "tmux"
  depends_on macos: :sonoma

  app "mogents.app"
  binary "#{appdir}/mogents.app/Contents/Library/LoginItems/mogents-host.app/Contents/Helpers/mogents",
         target: "mogents"

  caveats <<~EOS
    Closing the client does not stop the local helper or your tmux sessions.
    To stop the helper deliberately, use Quit from the menu-bar item and confirm.
  EOS
end
