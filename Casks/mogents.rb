cask "mogents" do
  version "0.7.7"
  sha256 "05b3b56d7f5b8e2de126c4296cecb37d874e639ecee308f23bae217a226c9147"

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
