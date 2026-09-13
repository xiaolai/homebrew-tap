cask "type-review" do
  version "1.0.3"
  sha256 "8be1b1711c2acc3e171919956f953055f0b4c9c0d2ffff8188450c3c761cc1b8"

  url "https://github.com/xiaolai/type-review-app-macos/releases/download/v#{version}/TYPE-#{version}-direct.zip"
  name "TYPE"
  desc "Typing practice that adapts to the keys you miss"
  homepage "https://type.review"

  livecheck do
    url :url
    strategy :github_latest
  end

  # arm64 only. There is no universal binary: `make` builds for the
  # machine it runs on, and releases are cut on Apple silicon.
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "TYPE.app"

  # The direct build's identifier. The Mac App Store build carries
  # `review.type.app` and its own container, so uninstalling this one
  # must not reach into the other's data.
  zap trash: [
    "~/Library/Application Support/review.type.app.direct",
    "~/Library/Caches/review.type.app.direct",
    "~/Library/HTTPStorages/review.type.app.direct",
    "~/Library/Preferences/review.type.app.direct.plist",
    "~/Library/Saved Application State/review.type.app.direct.savedState",
  ]
end
