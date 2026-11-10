# luishscosta/tap

Homebrew tap for [Horizon Mouse](https://github.com/luishscosta/horizon-mouse), a macOS menu bar app for mouse button gestures, smooth desktop switching and smooth scrolling.

```sh
brew trust luishscosta/tap
brew install luishscosta/tap/horizon-mouse
```

Homebrew asks you to trust third-party taps once with `brew trust`.

The app is self-signed and not notarized, so macOS blocks the first launch; the cask prints how to remove the quarantine flag.

Formerly Mac Mouse Desk: the old `mac-mouse-desk` cask name migrates to `horizon-mouse` automatically.
