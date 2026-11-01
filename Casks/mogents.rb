cask "mogents" do
  version "0.7.8"
  sha256 "de81f72337e4f81afd211661d404476661932fee84bfc1929a7926912b6a20df"

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
