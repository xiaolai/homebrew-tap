cask "vmark" do
  version "0.2.3"
  sha256 "92e001b136da8a8c5eac6b3fe3de35be1fa5bad97d27a925ec039282d299e729"

  url "https://github.com/xiaolai/vmark/releases/download/v#{version}/VMark_#{version}_universal.dmg"
  name "VMark"
  desc "Modern Markdown editor with WYSIWYG and source mode"
  homepage "https://github.com/xiaolai/vmark"

  livecheck do
    url :url
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
