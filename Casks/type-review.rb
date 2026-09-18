cask "type-review" do
  version "1.1.0"
  sha256 "ee018b5dee2d293522dafbce96632b6bcc1214a155a20c3b46a196fc376a7e2a"

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
