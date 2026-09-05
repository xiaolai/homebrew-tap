cask "zed" do
  version "1.20.0-fork.1"
  sha256 "a0f82155afc10798905ea763197fab2ea0377f58e7dbedcda409d4a17d673a5a"

  url "https://github.com/xiaolai/zed/releases/download/v#{version}/Zed-aarch64.dmg"
  name "Zed"
  desc "Code editor, personal fork with workspace tabs in the title bar"
  homepage "https://github.com/xiaolai/zed"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  # No auto_updates stanza on purpose. The in-app updater is disabled at compile
  # time, because upstream's would replace this build with official Zed, so
  # `brew upgrade` is the only update path and Homebrew must not skip it.
  # Shares the token "zed" with the official cask, so there is only ever one
  # Caskroom entry and installing this replaces it. A bare `brew install zed`
  # still resolves to homebrew/cask; this one needs its full name.
  depends_on macos: :big_sur
  depends_on arch: :arm64

  app "Zed.app"
  binary "#{appdir}/Zed.app/Contents/MacOS/cli", target: "zed"
  generate_completions_from_executable "#{HOMEBREW_PREFIX}/bin/zed", "--completions",
                                       shells: [:bash, :zsh, :fish]

  uninstall quit: "dev.zed.Zed"

  # ~/.config/zed is deliberately absent from this list. The official cask zaps
  # it, but here it is hand-maintained configuration that outlives any single
  # build, and `brew uninstall --zap` should not take it.
  zap trash: [
    "~/Library/Application Support/Zed",
    "~/Library/Caches/dev.zed.Zed",
    "~/Library/Caches/Zed",
    "~/Library/HTTPStorages/dev.zed.Zed",
    "~/Library/Logs/Zed",
    "~/Library/Preferences/dev.zed.Zed.plist",
    "~/Library/Saved Application State/dev.zed.Zed.savedState",
  ]
end
