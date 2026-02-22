cask "vmark" do
  version "0.5.2"

  on_arm do
    sha256 "d5f7ef2b1ccd5c0a66bef1bef80b71faef3f6d7f7f4eaa056e72e2482fd37035"
    url "https://github.com/xiaolai/vmark/releases/download/v#{version}/VMark_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "08b57891d0da05b14ea31b4741c5fb05dfd942686f9160410d5e6d0ea649e315"
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
