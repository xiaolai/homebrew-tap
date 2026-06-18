cask "vmark" do
  version "0.8.6"

  on_arm do
    sha256 "8671bb59ffc6659d1d689676b39f2b102523f4e02027d9d2baa90d26fa7ffd64"

    url "https://github.com/xiaolai/vmark/releases/download/v#{version}/VMark_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "372a0fca7c7c99b31da8bf30e4eb7489c04f9ab3b868a455a50319b2706848ec"

    url "https://github.com/xiaolai/vmark/releases/download/v#{version}/VMark_#{version}_x64.dmg"
  end

  name "VMark"
  desc "Modern Markdown editor with WYSIWYG and source mode"
  homepage "https://github.com/xiaolai/vmark"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on macos: :catalina

  app "VMark.app"

  zap trash: [
    "~/Library/Application Support/app.vmark",
    "~/Library/Caches/app.vmark",
    "~/Library/Preferences/app.vmark.plist",
    "~/Library/Saved Application State/app.vmark.savedState",
  ]
end
