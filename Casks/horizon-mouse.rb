cask "horizon-mouse" do
  version "0.3.9"
  sha256 "4756ae4a895faf9193bad5c7976f3d27c9d819fd20b425af1304fbfc313f9825"

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
