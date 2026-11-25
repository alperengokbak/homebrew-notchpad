cask "notchpad" do
  version "1.6.0"
  sha256 "105a06c170e0d533765f3a4351d1db3efe6690528aa8ecbaf0fb5d5565e116a8"

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
