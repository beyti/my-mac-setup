--file dependencies: hammerspoon, karabiner-elements
hs.alert.show("Hammerspoon config loaded")

hyper = {"cmd", "alt", "ctrl", "shift"}

--start functions
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

local spotify = {
    next      = function() hs.spotify.next() end,
    previous  = function() hs.spotify.previous() end,
    playPause = function() hs.spotify.playpause() end,
    display   = function() hs.spotify.displayCurrentTrack() end,
}

local brightness = {
    Up   = function() system.Event(static.EventKeys.BrightnessUp) end,
    Down = function() system.Event(static.EventKeys.BrightnessDown) end,
}

local hsEvent = hs.eventtap.event
local hsApplication = hs.application

local system = {}

function system.Event(key)
    hsEvent.newSystemKeyEvent(key, true):post()
    hsEvent.newSystemKeyEvent(key, false):post()
end

function system.OpenApp(name)
    return function()
        hsApplication.launchOrFocus(name)
        if name == 'Finder' then
            hs.appfinder.appFromName(name):activate()
        end
    end
end
--end functions

--Hammerspoon
hs.hotkey.bind(hyper, "I", debug)
hs.hotkey.bind(hyper, "*", function () hs.reload() end)

--Volume
hs.hotkey.bind(hyper, "up", volume.up)
hs.hotkey.bind(hyper, "down", volume.down)

--Screen
hs.hotkey.bind(hyper, "L", lockScreen)
hs.hotkey.bind(hyper, "return", toggleFullScreen)

--Spotify
hs.hotkey.bind(hyper, "C", spotify.playPause)
hs.hotkey.bind(hyper, "T", spotify.display)
hs.hotkey.bind(hyper, "right", spotify.next)
hs.hotkey.bind(hyper, "left", spotify.previous)

--Brightness
hs.hotkey.bind(hyper, "Q", brightness.Down)
hs.hotkey.bind(hyper, "W", brightness.Up)

--OpenApp
hs.hotkey.bind(hyper, "S", system.OpenApp("Slack"))
hs.hotkey.bind(hyper, "V", system.OpenApp("Visual Studio Code"))
