cask "whisper-scribe" do
  version "1.0.0"
  sha256 "77a037cd2084f4d03da81aba725c1831dd1d97b954e821241eec8c9de52cda2e"

  url "https://github.com/AmirFone/whisper-scribe/releases/download/v#{version}/Whisper.Scribe_#{version}_aarch64.dmg"
  name "Whisper Scribe"
  desc "On-device audio transcription and screen context for macOS"
  homepage "https://github.com/AmirFone/whisper-scribe"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "Whisper Scribe.app"

  # Wipe local data on uninstall when the user runs `brew uninstall --zap`.
  # Leaves user data alone on a plain uninstall so upgrades don't nuke
  # transcriptions and screen-context history.
  zap trash: [
    "~/Library/Application Support/com.whisperscribe.app",
    "~/Library/Preferences/com.whisperscribe.app.plist",
    "~/Library/Caches/com.whisperscribe.app",
    "~/Library/Saved Application State/com.whisperscribe.app.savedState",
    "~/Library/WebKit/com.whisperscribe.app",
  ]
end
