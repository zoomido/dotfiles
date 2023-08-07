-- Needed until  https://github.com/Hammerspoon/hammerspoon/issues/2478 is fixed
-- hs.configdir = os.getenv('HOME') .. '/.hammerspoon'
-- package.path = hs.configdir .. '/?.lua;' .. hs.configdir .. '/?/init.lua;' .. hs.configdir .. '/Spoons/?.spoon/init.lua;' .. package.path
---------------------------------------------------------------------------------------------------------------------------------------

-- Logger example
-- local log = hs.logger.new('Userlog','debug')
-- log.i('Initializing') -- will print "[mymodule] Initializing" to the console


---------------------------
-- Load custom keybindings
---------------------------

-- Define mash/hyper key
mash = { 'shift', 'ctrl', 'cmd' }


-- Send backtick & forwardtick immediately, also make backtick default
hs.hotkey.bind({}, '´', function()
    hs.eventtap.keyStrokes("`")
end)
hs.hotkey.bind({"shift"}, '´', function()
    hs.eventtap.keyStrokes("´")
end)

-- Send tilde directly
hs.hotkey.bind({'alt'}, '¨', function()
    hs.eventtap.keyStrokes("~")
end)

-- Hack to send dollar char
-- hs.hotkey.bind({'alt'}, '$', function()
--     hs.eventtap.keyStrokes("plop")
-- end)


-- Start/switch/hide Kitty
hs.hotkey.bind({}, "§", function()
    local app = hs.application.find('kitty')
    if ( app and app:isFrontmost() ) then
        app:hide()
    else
        hs.application.open("kitty.app")
    end
end)
-- Start/switch/hide Warp terminal
-- hs.hotkey.bind({}, "§", function()
--     local app = hs.application.find('Warp')
--     if ( app and app:isFrontmost() ) then
--         app:hide()
--     else
--         hs.application.open("warp.app")
--     end
-- end)


-- Start/switch/hide browser
hs.hotkey.bind({"cmd"}, "§", function()
    local app = hs.application.find('brave')
    if ( app and app:isFrontmost() ) then
        app:hide()
    else
        hs.application.open("Brave Browser.app")
    end
end)
-- Start/switch to browser and reload
hs.hotkey.bind({"cmd", "shift"}, "return", function()
    -- hs.eventtap.keyStrokes(":w")
    -- hs.eventtap.keyStroke({}, "return")
    hs.application.open("Brave Browser.app")
    hs.eventtap.keyStroke({"cmd"}, "3")
    hs.timer.doAfter(0.1, function()
        hs.eventtap.keyStroke({"cmd"}, "r")
    end)
end)


-- Start/switch/hide Obsidian
hs.hotkey.bind({"shift"}, "§", function()
    local app = hs.application.find('Obsidian')
    if ( app and app:isFrontmost() ) then
        app:hide()
    else
        hs.application.open("Obsidian.app")
    end
end)


-- Start/switch/hide Spotify
hs.hotkey.bind(mash, "m", function()
    local app = hs.application.find('spotify')
    if ( app and app:isFrontmost() ) then
        app:hide()
    else
        hs.application.open("Spotify.app")
    end
end)


-- For center screen and make it almost fullscreen
hs.window.animationDuration = 0
units = {
  fullscreen        = { x = 0.0, y = 0.0, w = 1, h = 1 },
  almostFullscreen  = { x = 0.025, y = 0.04, w = 0.946, h = 0.930 },
  centerSmall       = { x = 0.1, y = 0.1, w = 0.8, h = 0.8 },
  smallMobile       = { x = 0.02, y = 0.02, w = 0.346, h = 0.975 },
  inspectorChrome   = { x = 0.366, y = 0.02, w = 0.61, h = 0.975 }
}
hs.hotkey.bind(mash, 'f', function()
        hs.window.focusedWindow():move(units.fullscreen,  nil, true)
end)
hs.hotkey.bind(mash, 'a', function()
        hs.window.focusedWindow():move(units.almostFullscreen,  nil, true)
end)
hs.hotkey.bind(mash, 'c', function()
        hs.window.focusedWindow():move(units.centerSmall,  nil, true)
end)
hs.hotkey.bind(mash, 's', function()
    hs.window.focusedWindow():move(units.smallMobile,  nil, true)
end)
hs.hotkey.bind(mash, 'i', function()
    hs.window.focusedWindow():move(units.inspectorChrome,  nil, true)
end)

-- Send mouse away
-- hs.hotkey.bind(mash, "m", function()
--     hs.mouse.setRelativePosition({ x=3, y=500 })
-- end)



--------------------------
-- Custom window switcher
--------------------------
-- set up your windowfilter
-- switcher = hs.window.switcher.new() -- default windowfilter: only visible windows, all Spaces
-- switcher_browsers = hs.window.switcher.new{'Safari','Google Chrome'} -- specialized switcher for your dozens of browser windows :)
-- switcher_space = hs.window.switcher.new(hs.window.filter.new():setCurrentSpace(true):setDefaultFilter{}) -- include minimized/hidden windows, current Space only
-- switcher_space.ui.showTitles = false
-- switcher_space.ui.backgroundColor = {0.1,0.1,0.1,0.3}
-- switcher_space.ui.selectedThumbnailSize = 300
-- switcher_space.ui.showSelectedTitle = false
-- switcher_space.ui.fontName = 'Helvetica'
-- hs.window.animationDuration = 0

-- bind to hotkeys; WARNING: at least one modifier key is required!
-- hs.hotkey.bind('alt', 'tab', nil, function()switcher_space:next()end)
-- hs.hotkey.bind('alt-shift', 'tab', nil, function()switcher_space:previous()end)


--------------------------
-- Load SpoonInstall plug
--------------------------
-- hs.loadSpoon("SpoonInstall")


---------------------------
-- Load ControlEscape plug
---------------------------
-- spoon.SpoonInstall:andUse('ControlEscape', {
--     start = true
-- })
hs.loadSpoon('ControlEscape'):start() -- Load Hammerspoon bits from https://github.com/jasonrudolph/ControlEscape.spoon


-----------------
-- ClipboardTool
-----------------
-- spoon.SpoonInstall:andUse('ClipboardTool', {
--    hotkeys = {
--        show_clipboard = { {"ctrl","cmd"},"v"}
--    },
--    config = {
--        menubar_title = "\u{2702}",
--        paste_on_select = true,
--    },
--    start = true
-- })


---------------------
-- Global Mute spoon
---------------------
hs.loadSpoon("GlobalMute")
spoon.GlobalMute:bindHotkeys({
    toggle = {{"ctrl","cmd","shift"}, "z"}
})
spoon.GlobalMute:configure({
    enforce_desired_state = true,
    unmute_title = "<---- HOT MIC -----",
    mute_title = "",
})
-- Listen for event and show alert
local inputDevice = hs.audiodevice.defaultInputDevice()
local lastMuteValue = inputDevice:muted()
function muteWatcher(uid, event)
    if event == 'mute' and inputDevice:muted() == true and lastMuteValue == false then
        hs.alert.closeSpecific(muteWindow)
        muteWindow = hs.alert.show('Muted', {
            strokeColor = hs.drawing.color.x11.ivory,
            fillColor = hs.drawing.color.x11.khaki,
            textColor = hs.drawing.color.x11.green,
            strokeWidth = 5,
            radius = 5,
            textSize = 56,
            atScreenEdge = 0
        }, 2)
    elseif event == 'mute' then
        hs.alert.closeSpecific(muteWindow)
        muteWindow = hs.alert.show('Unmuted 🎤', {
            strokeColor = hs.drawing.color.x11.ivory,
            fillColor = hs.drawing.color.x11.khaki,
            textColor = hs.drawing.color.x11.firebrick,
            strokeWidth = 5,
            radius = 5,
            textSize = 56,
            atScreenEdge = 0
        }, 2)
    end
    lastMuteValue = inputDevice:muted()
end
inputDevice:watcherCallback(muteWatcher)
inputDevice:watcherStart()


----------------------------------------
-- Load Lunette (Spectacle keybindings)
----------------------------------------
-- hs.loadSpoon("Lunette")
-- customBindings = {
--     center = false,
--     fullScreen = {
--         {mash, "f"}
--     },
--     leftHalf = {
--         {mash, "h"}
--     },
--     rightHalf = {
--         {mash, "l"}
--     },
--     topHalf = false,
--     bottomHalf = false,
--     topLeft = false,
--     bottomLeft = false,
--     topRight = false,
--     bottomRight = false,
--     nextDisplay = {
--         {mash, "d"}
--     },
--     prevDisplay = false,
--     nextThird = false,
--     prevThird = false,
--     enlarge = false,
--     shrink = false,
--     undo = false,
--     redo = false,
-- }
-- spoon.Lunette:bindHotkeys(customBindings)


-----------
-- MicMute
-----------
-- spoon.SpoonInstall:andUse('MicMute', {
--     hotkeys = {
--         toggle = { {"ctrl","cmd","shift"},"m"}
--     }
-- })


-------------------
-- Load MenuHammer
-------------------
-- menuHammer = hs.loadSpoon("MenuHammer")
-- Activate the root menu
-- menuHammer:enter()


-------------------
-- Expose for apps
-- https://www.hammerspoon.org/docs/hs.expose.html
-------------------
-- set up your instance(s)
-- expose = hs.expose.new(nil,{
--     showThumbnails = true,
--     includeNonVisible = true,
-- }) -- default windowfilter, no thumbnails
-- expose_app = hs.expose.new(nil,{onlyActiveApplication=true}) -- show windows for the current application
-- expose_space = hs.expose.new(nil,{includeOtherSpaces=false}) -- only windows in the current Mission Control Space
-- expose_browsers = hs.expose.new{'Safari','Google Chrome'} -- specialized expose using a custom windowfilter
-- then bind to a hotkey
-- hs.hotkey.bind({'cmd','ctrl'}, 'tab', 'Expose',function()expose:toggleShow()end)


-----------------------
-- Low battery warning
-- DOES NOT WORK RIGHT NOW
-----------------------
-- local batWatcher = nil
-- local lastBatVal = hs.battery.percentage()
-- function batPercentageChangedCallback()
--     currentPercent = hs.battery.percentage()
--     isCharging = hs.battery.isCharging()
--     if isCharging == true then
--         hs.alert.closeSpecific(batteryInfoWindow, 0)
--         return
--     end
--     if currentPercent == 100 and lastBatVal == 99 then
--         hs.notify.new({
--             title = 'Battery at 100%',
--             subTitle = 'Fully charged',
--             alwaysPresent = 1,
--             autoWithdraw = 0,
--             withdrawAfter = 0
--         }):send()
--     elseif currentPercent == 30 and lastBatVal > 30 then
--         hs.notify.new({
--             title = 'Battery at 30%',
--             subTitle = 'Notice: Running on battery',
--             alwaysPresent = 1,
--             autoWithdraw = 0,
--             withdrawAfter = 0
--         }):send()
--     elseif currentPercent == 20 and lastBatVal > 20 then
--         hs.notify.new({
--             title = 'Battery at 20%',
--             subTitle = 'Dont sweat it just yet',
--             alwaysPresent = 1,
--             autoWithdraw = 0,
--             withdrawAfter = 0
--         }):send()
--     elseif currentPercent == 15 and lastBatVal > 15 then
--         hs.notify.new({
--             title = 'Battery at 15%',
--             subTitle = 'A slight sweat would be good now',
--             alwaysPresent = 1,
--             autoWithdraw = 0,
--             withdrawAfter = 0
--         }):send()
--     elseif currentPercent == 10 and lastBatVal > 10 then
--         hs.notify.new({
--             title = 'Low battery: 10%',
--             subTitle = 'Time to get serious with that charger',
--             alwaysPresent = 1,
--             autoWithdraw = 0,
--             withdrawAfter = 0
--         }):send()
--     elseif currentPercent < 6 and currentPercent ~= lastBatVal then
--         batteryInfoWindow = hs.alert.show('Live or let die: = ' .. currentPercent .. '%', {
--             strokeColor = hs.drawing.color.x11.goldenrod,
--             fillColor = hs.drawing.color.x11.red,
--             textColor = hs.drawing.color.x11.goldenrod,
--             strokeWidth = 10,
--             radius = 10,
--             textSize = 62,
--             fadeInDuration = 8,
--             atScreenEdge = 0
--         }, 40)
--     end
--     -- if currentPercent == 7 then
--     --     hs.alert.closeAll()
--     -- end
--     lastBatVal = currentPercent
-- end
-- batWatcher = hs.battery.watcher.new(batPercentageChangedCallback)
-- batWatcher:start()


-- experiment
-- ----------
-- function closeBatteryWindow()
--     hs.alert.closeSpecific(batteryInfoWindow, 0)
-- end
-- hs.hotkey.bind({ 'cmd' }, 'a',  function() closeBatteryWindow() end)

-- hs.hotkey.bind({ 'ctrl' }, 'a', function()
--     hs.notify.new({
--         title = 'Battery at 20%',
--         subTitle = 'This is a subtitle',
--         alwaysPresent = 1,
--         autoWithdraw = 0,
--         withdrawAfter = 0
--     }):send()
-- end)




-------------------------------------------------------------------
-- Launcher (copied from somewhere online)
--
-- This is the awesome. The other stuff is all cool, but this is the
-- thing I love the most because it reduces the amount of time I
-- spend with the mouse, and is far more deterministic than trying
-- to use cmd+tab.
--
-- The idea here is to have a MODE-BASED app launching and app
-- switching system. Traditional Mac philosophy (and Emacs :D)
-- would have us contort our hands into crazy combinations of keys
-- to manipulate the state of the machine, which is a serious pain
-- in the ass. Using Hammerspoon we can avoid that.
--
-- * ctrl+space gets us into "launch mode"
-- * In "launch mode" the keyboard changes so that each key can now
--   have a new meaning. For example, the 'v' key is now responsible
--   for either launching or switching to VimR
-- * You can then map whatever you like to whatever function you'd
--   like to invoke.
--
-- It's just a big pile of awesome.
-------------------------------------------------------------------

-- -- We need to store the reference to the alert window
-- appLauncherAlertWindow = nil

-- -- This is the key mode handle
-- launchMode = hs.hotkey.modal.new({}, nil, '')

-- -- Leaves the launch mode, returning the keyboard to its normal
-- -- state, and closes the alert window, if it's showing
-- function leaveMode()
--   if appLauncherAlertWindow ~= nil then
--     hs.alert.closeSpecific(appLauncherAlertWindow, 0)
--     appLauncherAlertWindow = nil
--   end
--   launchMode:exit()
-- end

-- -- So simple, so awesome.
-- function switchToApp(app)
--   hs.application.open(app)
--   leaveMode()
-- end

-- -- Enters launch mode. The bulk of this is geared toward
-- -- showing a big ugly window that can't be ignored; the
-- -- keyboard is now in launch mode.
-- hs.hotkey.bind({ 'ctrl' }, 'space', function()
--   launchMode:enter()
--   appLauncherAlertWindow = hs.alert.show('App Launcher Mode', {
--     strokeColor = hs.drawing.color.x11.gray,
--     fillColor = hs.drawing.color.x11.magenta,
--     textColor = hs.drawing.color.x11.black,
--     strokeWidth = 10,
--     radius = 50,
--     textSize = 64,
--     fadeInDuration = 5,
--     atScreenEdge = 2
--   }, 'infinite')
-- end)

-- -- When in launch mode, hitting ctrl+space again leaves it
-- launchMode:bind({ 'ctrl' }, 'space', function() leaveMode() end)
-- launchMode:bind({}, 'escape',  function() leaveMode() end)

-- -- Mapped keys
-- launchMode:bind({}, 'v',  function() switchToApp('Vivaldi.app') end)
-- launchMode:bind({}, 'i',  function() switchToApp('iTerm.app') end)
-- launchMode:bind({}, 'p',  function() switchToApp('PhpStorm.app') end)

-- -- launchMode:bind({}, 'd',  function() leaveMode(); deepwork() end)
-- -- launchMode:bind({"shift"}, 'd',  function() leaveMode(); interrogateDeepWorkTimer() end)
-- -- launchMode:bind({}, 'f',  function() switchToApp('Firefox.app') end)
-- -- launchMode:bind({}, 'o',  function() switchToApp('Microsoft Outlook.app') end)
-- -- launchMode:bind({}, '`',  function() hs.reload(); leaveMode() end)
