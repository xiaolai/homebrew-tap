cask "mogents-ai" do
  version "0.2.2"
  sha256 "6e8fcebcf89862fa4090d56b988d409eb8c912770a3c324984085ea473aea1f6"

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
  binary "#{appdir}/mogents-ai.app/Contents/Library/LoginItems/mogents-ai-host.app/Contents/Helpers/chatmux",
         target: "mogents-ai"

  caveats <<~EOS
    Before upgrading or uninstalling, choose Quit mogents-ai… from the tray menu
    and confirm. Command-Q does not quit the app or its local helper.
  EOS
end
