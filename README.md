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
```
hs.alert.show("Hammerspoon config loaded")

hyper = {"cmd", "alt", "ctrl", "shift"}

function debug()
    hs.alert.show("Hello World!")
end

function lockScreen()
    hs.caffeinate.lockScreen()
end

function toggleFullScreen()
    local win = hs.window.frontmostWindow()
    win:setFullscreen(not win:isFullscreen())
end

local function sendSystemKey(key)
    hs.eventtap.event.newSystemKeyEvent(key, true):post()
    hs.eventtap.event.newSystemKeyEvent(key, false):post()
end

local volume = {
    up   = function() sendSystemKey("SOUND_UP") end,
    down = function() sendSystemKey("SOUND_DOWN") end,
    mute = function() sendSystemKey("MUTE") end,
}

hs.hotkey.bind(hyper, "up", volume.up)
hs.hotkey.bind(hyper, "down", volume.down)
hs.hotkey.bind(hyper, "I", debug)
hs.hotkey.bind(hyper, "L", lockScreen)
hs.hotkey.bind(hyper, "return", toggleFullScreen)
hs.hotkey.bind(hyper, "C", function() hs.spotify.playpause() end)
hs.hotkey.bind(hyper, "T", function() hs.spotify.displayCurrentTrack() end)
```
* 

