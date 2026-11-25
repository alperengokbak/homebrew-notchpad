cask "notchpad" do
  version "1.5.0"
  sha256 "d0331e3ac43ca133c057e5d20f67977258a65bfd7c61a46548ead4e716bbcca1"

  url "https://github.com/alperengokbak/notchpad/releases/download/v#{version}/Notchpad-#{version}.zip"
  name "Notchpad"
  desc "Turns the notch into a panel with music, reminders, files, a focus timer and more"
  homepage "https://github.com/alperengokbak/notchpad"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "Notchpad.app"

  zap trash: [
    "~/Library/Application Support/Notchpad",
    "~/Library/Preferences/com.alperengokbak.notchpad.plist",
  ]

  caveats <<~EOS
    Notchpad isn't notarised by Apple. The first time you open it, macOS blocks it:
    go to System Settings → Privacy & Security and click "Open Anyway". You only do this once.
  EOS
end
