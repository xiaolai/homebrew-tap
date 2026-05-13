cask "claudepot" do
  version "0.1.29"

  on_arm do
    sha256 "aeb60c9d6c3435ad7d710a13355a4b7c66f67b9e6ae450e5cde9f06c196cb670"

    url "https://github.com/xiaolai/claudepot-app/releases/download/v#{version}/Claudepot-aarch64.dmg"
  end
  on_intel do
    sha256 "17bb30f69a8d4f0482074c216507a11ffa0c602de2ca64d789f90592a2774af7"

    url "https://github.com/xiaolai/claudepot-app/releases/download/v#{version}/Claudepot-x86_64.dmg"
  end

  binary "#{appdir}/Claudepot.app/Contents/MacOS/claudepot-cli",
         target: "claudepot"

  name "Claudepot"
  desc "Multi-account Claude Code / Claude Desktop switcher"
  homepage "https://claudepot.com/app/"

  livecheck do
    url "https://github.com/xiaolai/claudepot-app"
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
