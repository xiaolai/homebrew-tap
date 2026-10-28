cask "mogents-ai" do
  version "0.3.0"
  sha256 "9af05d885613ef5b9bb0ff04f86b1b5af35777dfa730ceede9c517d908588ebd"

  url "https://github.com/xiaolai/mogents-ai/releases/download/v#{version}/mogents-ai-#{version}-macos-universal.zip"
  name "Mogents AI"
  desc "Chat workspace for persistent tmux agents with a local host helper"
  homepage "https://github.com/xiaolai/mogents-ai"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on formula: "tmux"
  depends_on macos: :sonoma

  app "mogents-ai.app"
  binary "#{appdir}/mogents-ai.app/Contents/Library/LoginItems/mogents-ai-host.app/Contents/Helpers/mogents-ai",
         target: "mogents-ai"

  caveats <<~EOS
    This release is a breaking rename. An existing helper installation, its local
    state and any paired device are not migrated; quit the previous app, then
    run `brew uninstall --cask mogents-ai` before installing this version, and
    re-pair afterwards.

    Before upgrading or uninstalling, choose Quit mogents-ai… from the tray menu
    and confirm. Command-Q does not quit the app or its local helper.
  EOS
end
