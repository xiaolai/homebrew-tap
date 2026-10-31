cask "mogents" do
  version "0.7.0"
  sha256 "268249fd2c7dbdcb598ca0f61b2e9cb6c50d26ec11e5c96a6790b2f7774ebfe0"

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
    This release renames the product to mogents and changes the bundle identity.
    macOS treats it as a different app, so there is no container, Keychain or
    pairing migration. If you are coming from mogents-ai, uninstall it first:

      brew uninstall --cask mogents-ai

    Then install this cask and re-pair your devices.

    Before upgrading or uninstalling, choose Quit mogents… from the tray menu
    and confirm. Command-Q does not quit the app or its local helper.
  EOS
end
