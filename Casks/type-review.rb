cask "type-review" do
  version "1.1.3"
  sha256 "82d8a1084394c9a274eab3466a4bb87bb2454a0e2d05958d1024d59ab2df1166"

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
