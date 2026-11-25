cask "notchpad" do
  version "1.5.3"
  sha256 "8967e4212109637ce0791ce8fa6ffa8fcb51c01cfba5e2f34dc7b5d0f5622d4e"

  url "https://github.com/alperengokbak/notchpad/releases/download/v#{version}/Notchpad-#{version}.zip"
  name "Notchpad"
  desc "Notch panel with music, reminders, files, a focus timer and more"
  homepage "https://github.com/alperengokbak/notchpad"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

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
