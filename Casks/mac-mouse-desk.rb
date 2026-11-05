cask "mac-mouse-desk" do
  version "0.1.1"
  sha256 "55b155cdde9cd4e6ea55d9520f50c1bfcb70582a2ab0c0be334b6e47fdc006ca"

  url "https://github.com/luishscosta/mac-mouse-desk/releases/download/v#{version}/MacMouseDesk.zip"
  name "Mac Mouse Desk"
  desc "Button gestures and smooth desktop switching for mice with a side wheel"
  homepage "https://github.com/luishscosta/mac-mouse-desk"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Mac Mouse Desk.app"

  uninstall quit: "local.macos-config.Mesa"

  zap trash: "~/Library/Preferences/local.macos-config.Mesa.plist"

  caveats <<~EOS
    Mac Mouse Desk is not notarized by Apple, so macOS blocks the first launch.
    Before opening it (and after each upgrade), remove the quarantine:
      xattr -dr com.apple.quarantine "/Applications/Mac Mouse Desk.app"
    Or open it, click OK (not "Move to Trash") and use
    System Settings > Privacy & Security > Open Anyway.
    Then authorize it under Accessibility to capture the mouse.
  EOS
end
