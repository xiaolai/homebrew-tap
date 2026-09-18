cask "type-review" do
  version "1.1.1"
  sha256 "0c7af9695b03f7c96896f8a2a3bb51c3eaa18faa65cd926a52f4227ea83a30e0"

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
