cask "cubus" do
  version "0.2.3"
  sha256 "5039e3b36416a4675dffb0f01e58ec80a5789db9ebf7a1dda05a96b23de9d569"

  url "https://github.com/xiaolai/cubus/releases/download/v#{version}/cubus_#{version}_universal.dmg"
  name "cubus"
  desc "Rubik's Cube tutor that reads your cube with the camera and guides the solve"
  homepage "https://github.com/xiaolai/cubus"

  # One universal binary covers both architectures, so there is no arch split here.
  #
  # NO auto_updates, deliberately, and it is the macOS update story rather than an
  # omission: Homebrew is in charge here, so `brew upgrade` keeps moving cubus exactly
  # as it always has. The app's own updater (tauri-plugin-updater) is compiled only for
  # Windows and Linux — see SELF_UPDATE_PLATFORMS in apps/web/lib/app-update.js — because
  # a cask and a self-updater both write to this same bundle while only one of them knows
  # what is really there. Declaring auto_updates would tell brew to stand down and hand
  # the job to an updater macOS does not have.
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
