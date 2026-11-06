cask "horizon-mouse" do
  version "0.3.1"
  sha256 "e9c464f3e18c81cfee70001ab404e0a1c859072e5631951d71e68d7dc5c68635"

  url "https://github.com/luishscosta/horizon-mouse/releases/download/v#{version}/HorizonMouse.zip"
  name "Horizon Mouse"
  desc "Button gestures and smooth desktop switching for wheel mice"
  homepage "https://github.com/luishscosta/horizon-mouse"

  depends_on macos: :sonoma

  app "Horizon Mouse.app"

  uninstall quit: "io.github.luishscosta.horizonmouse"

  zap trash: [
    "~/Library/Preferences/io.github.luishscosta.horizonmouse.plist",
    "~/Library/Preferences/local.macos-config.Mesa.plist",
  ]

  caveats <<~EOS
    Horizon Mouse is not notarized by Apple, so macOS blocks the first launch.
    Before opening it (and after each upgrade), remove the quarantine:
      xattr -dr com.apple.quarantine "/Applications/Horizon Mouse.app"
    Or open it, click OK (not "Move to Trash") and use
    System Settings > Privacy & Security > Open Anyway.
    Then authorize it under Accessibility to capture the mouse.
  EOS
end
