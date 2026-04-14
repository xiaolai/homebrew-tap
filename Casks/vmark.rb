cask "vmark" do
  version "0.6.40"

  on_arm do
    sha256 "9c05317b90def8f449fa4cb1f9f3918aad2fd36aad192af9113f1361ac2ba08e"
    url "https://github.com/xiaolai/vmark/releases/download/v#{version}/VMark_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "a4202a734084e66932a4453ea8118c701c293e4e15bcd258f115560acec49dee"
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
