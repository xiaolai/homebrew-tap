cask "cubus" do
  version "0.2.6"
  sha256 "990bd8ecaaa32a9ca4b41e5e95428cd58243f6b4b93b3f00b3e4d2b7b7717f2e"

  url "https://github.com/xiaolai/cubus/releases/download/v#{version}/cubus_#{version}_universal.dmg"
  name "cubus"
  desc "Rubik's Cube tutor that reads your cube with the camera and guides the solve"
  homepage "https://github.com/xiaolai/cubus"

  # One universal binary covers both architectures, so there is no arch split here.
  #
  # NO auto_updates, deliberately, and it means BOTH paths work rather than neither.
  #
  # The app does update itself on macOS (tauri-plugin-updater; see SELF_UPDATE_PLATFORMS
  # in apps/web/lib/app-update.js). Declaring auto_updates would tell Homebrew to stand
  # down and leave the app as the only way, and plenty of people manage their Mac with
  # `brew upgrade` and expect it to keep working. Left off, both do.
  #
  # The two do not fight, because they move together: each follows the same GitHub
  # releases, and this workflow runs on `release: published` — within seconds of the
  # manifest the app reads. So `brew upgrade` reinstalls the version the app already
  # has, which is a redundant copy rather than a downgrade. The downgrade worth fearing
  # needs the cask to LAG the app, and that is a property of a tap that updates late.
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
