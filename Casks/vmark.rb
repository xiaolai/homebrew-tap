cask "vmark" do
  version "0.6.34"

  on_arm do
    sha256 "b05d3fbf5d4b4dc55edaba5434d3453a60e63e0dff082e58d35ef1bf27bee5a5"
    url "https://github.com/xiaolai/vmark/releases/download/v#{version}/VMark_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "e2fc705e4f91ceb693ffd05da72c1a1d0b1f4a328beec5a64acdb8761bd42e0d"
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
