cask "notchpad" do
  version "1.5.1"
  sha256 "ab7a216f603308a29a478ddb385057f45914ec3777bcd3a9573683e972e72627"

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
