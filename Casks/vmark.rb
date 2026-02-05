cask "vmark" do
  version "0.3.27"

  on_arm do
    sha256 "b048019ad2856a190a36d6da67994ec0b3b3573862b016751292cf847998f887"
    url "https://github.com/xiaolai/vmark/releases/download/v#{version}/VMark_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "79f67bafc3974ada5add7d8cdfbaec53d8840c718d17f3c0cbc801a425e823f5"
    url "https://github.com/xiaolai/vmark/releases/download/v#{version}/VMark_#{version}_x64.dmg"
  end

  name "VMark"
  desc "Modern Markdown editor with WYSIWYG and source mode"
  homepage "https://github.com/xiaolai/vmark"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on macos: ">= :catalina"

  app "VMark.app"

  zap trash: [
    "~/Library/Application Support/app.vmark",
    "~/Library/Caches/app.vmark",
    "~/Library/Preferences/app.vmark.plist",
    "~/Library/Saved Application State/app.vmark.savedState",
  ]
end
