cask "horizon-mouse" do
  version "0.2.0"
  sha256 "78fb80a4c19d1428e75af4040f943e8e3ec815f89033e5ebfc95b427d1c2f95e"

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
