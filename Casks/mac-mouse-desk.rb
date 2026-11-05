cask "mac-mouse-desk" do
  version "0.1.0"
  sha256 "f35bc3d5ea89da62a82c8d41b14cd646db171d3a1e720abe7f8949d729cc935c"

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
    Mac Mouse Desk is not notarized by Apple. On first launch macOS blocks it:
    open System Settings > Privacy & Security and click "Open Anyway".
    Then authorize it under Accessibility to capture the mouse.
  EOS
end
