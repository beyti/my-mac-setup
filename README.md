# My Mac Setup
ref: https://github.com/sb2nov/mac-setup

## Trackpad
System settings > Trackpad > Point & Click

    Enable > Tap to click with one finger
    Enable > Secondary Click with two fingers
    Uncheck > Lookup data detectors
    Enable > force click and haptic feedback

## Enable repeating keys by pressing and holding down keys
```defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false```  

## Change the default folder for screenshots
    Open the terminal and create the folder where you would like to store your screenshots: mkdir -p /path/to/screenshots/  
    Then run the following command: defaults write com.apple.screencapture location /path/to/screenshots/ && killall SystemUIServer

## Hyper Key (CapsLock) with Karabiner-elements  
```brew install --cask karabiner-elements```  
```brew install --cask hammerspoon```  

## Config & Run
* run hammerspoon  
* code ~/.hammerspoon/init.lua  
* use [init.lua](./.hammerspoon/init.lua) contents  
* add a complex key binding on karabiner-elements to enable hyper = cmd + opt + ctrl + shift
* Allow Karabiner-Elements on System Settings > Privacy & Security > Input Monitoring
* Allow Hammerspoon on System Settings > Privacy & Security > Accessibility

## Useful Scripts
### Sign VSCode to debug without firewall "allow connection" errors  
`sudo codesign --force --deep --sign - "/Applications/Visual Studio Code.app"`  
ref: https://apple.stackexchange.com/questions/3271/how-to-get-rid-of-firewall-accept-incoming-connections-dialog  
