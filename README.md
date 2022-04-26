# my-mac-setup
things to setup my mac env

ref: https://github.com/sb2nov/mac-setup

Trackpad

    Point & Click
        Enable Tap to click with one finger
        Enable Secondary Click with two fingers
        Uncheck Lookup data detectors
        Click force click and haptic feedback

Enable repeating keys by pressing and holding down keys: 
```defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false (and restart any app that you need to repeat keys in)```

Change the default folder for screenshots

    Open the terminal and create the folder where you would like to store your screenshots: mkdir -p /path/to/screenshots/
    Then run the following command: defaults write com.apple.screencapture location /path/to/screenshots/ && killall SystemUIServer

## Hyper Key (CapsLock) with Karabiner-elements
```brew install --cask karabiner-elements```
```brew install --cask hammerspoon```
* run hammerspoon
* nano ~/.hammerspoon/init.lua
* use [init.lua](./.hammerspoon/init.lua) contents
