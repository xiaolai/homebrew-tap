cask "claudepot" do
  version "0.0.20"

  on_arm do
    sha256 "84c5661396eaf89a49b3c7c1817b6d1c3141a851c42282b97204d0fb95b043fc"

    url "https://github.com/xiaolai/claudepot-app/releases/download/v#{version}/Claudepot-aarch64.dmg"
  end
  on_intel do
    sha256 "9f0c6a4d3df04b7604f56b230b28c92fc184109ac6fcb7d10294a87f46c66770"

    url "https://github.com/xiaolai/claudepot-app/releases/download/v#{version}/Claudepot-x86_64.dmg"
  end

  binary "#{appdir}/Claudepot.app/Contents/MacOS/claudepot-cli",
         target: "claudepot"

  name "Claudepot"
  desc "Multi-account Claude Code / Claude Desktop switcher"
  homepage "https://github.com/xiaolai/claudepot-app"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on macos: ">= :catalina"

  app "Claudepot.app"

  zap trash: [
    "~/.claudepot",
    "~/Library/Caches/com.claudepot.app",
    "~/Library/Preferences/com.claudepot.app.plist",
    "~/Library/Saved Application State/com.claudepot.app.savedState",
    "~/Library/WebKit/com.claudepot.app",
  ]
end
