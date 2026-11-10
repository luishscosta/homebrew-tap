cask "horizon-mouse" do
  version "0.3.3"
  sha256 "8a7c385d0fe553c8f4f0da5a7a9caac4377a5dee5be0e1e8efcf4b9bce088266"

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
