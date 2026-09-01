cask "cubus" do
  version "0.2.1"
  sha256 "a97f4c2fcac7bcc472fa9daa699f513eb9a5be46842e6e917acfa673265cd14f"

  url "https://github.com/xiaolai/cubus/releases/download/v#{version}/cubus_#{version}_universal.dmg"
  name "cubus"
  desc "Rubik's Cube tutor that reads your cube with the camera and guides the solve"
  homepage "https://github.com/xiaolai/cubus"

  # One universal binary covers both architectures, so there is no arch split here.
  # No auto_updates: the app does not update itself, so plain `brew upgrade` is correct for it.
  depends_on macos: :ventura

  app "cubus.app"

  zap trash: [
    "~/Library/Application Support/im.cubus.app",
    "~/Library/Caches/im.cubus.app",
    "~/Library/HTTPStorages/im.cubus.app",
    "~/Library/Preferences/im.cubus.app.plist",
    "~/Library/Saved Application State/im.cubus.app.savedState",
    "~/Library/WebKit/im.cubus.app",
  ]
end
