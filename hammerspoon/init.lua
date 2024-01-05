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
Units = {
  fullscreen        = { x = 0.0, y = 0.0, w = 1, h = 1 },
  almostFullscreen  = { x = 0.025, y = 0.04, w = 0.946, h = 0.930 },
  centerSmall       = { x = 0.1, y = 0.1, w = 0.8, h = 0.8 },
  leftHalf       = { x = 0, y = 0, w = 0.495, h = 1 },
  rightHalf       = { x = 0.501, y = 0, w = 0.5, h = 1 },
  topHalf       = { x = 0, y = 0, w = 1, h = 0.495 },
  bottomHalf       = { x = 0, y = 0.501, w = 1, h = 0.5 },
  smallMobile       = { x = 0.02, y = 0.02, w = 0.346, h = 0.975 },
  inspectorChrome   = { x = 0.366, y = 0.02, w = 0.61, h = 0.975 }
}
hs.hotkey.bind(mash, 'f', function()
        hs.window.focusedWindow():move(Units.fullscreen,  nil, true)
end)
hs.hotkey.bind(mash, 'a', function()
        hs.window.focusedWindow():move(Units.almostFullscreen,  nil, true)
end)
hs.hotkey.bind(mash, 'c', function()
        hs.window.focusedWindow():move(Units.centerSmall,  nil, true)
end)
hs.hotkey.bind(mash, 'left', function()
        hs.window.focusedWindow():move(Units.leftHalf,  nil, true)
end)
hs.hotkey.bind(mash, 'right', function()
        hs.window.focusedWindow():move(Units.rightHalf,  nil, true)
end)
hs.hotkey.bind(mash, 'up', function()
        hs.window.focusedWindow():move(Units.topHalf,  nil, true)
end)
hs.hotkey.bind(mash, 'down', function()
        hs.window.focusedWindow():move(Units.bottomHalf,  nil, true)
end)
hs.hotkey.bind(mash, 's', function()
    hs.window.focusedWindow():move(Units.smallMobile,  nil, true)
end)
hs.hotkey.bind(mash, 'i', function()
    hs.window.focusedWindow():move(Units.inspectorChrome,  nil, true)
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
switcher = hs.window.switcher.new(hs.window.filter.new():setCurrentSpace(true):setDefaultFilter{}) -- include minimized/hidden windows, current Space only
switcher.ui.showTitles = false
switcher.ui.backgroundColor = {0.1,0.1,0.1,0.3}
switcher.ui.selectedThumbnailSize = 300
switcher.ui.showSelectedTitle = false
switcher.ui.fontName = 'Helvetica'
-- hs.window.animationDuration = 0

-- -- bind to hotkeys; WARNING: at least one modifier key is required!
-- hs.hotkey.bind('alt','tab','Next window',function()switcher:next()end)
-- hs.hotkey.bind('alt-shift','tab','Prev window',function()switcher:previous()end)
-- Override cmd-tab macos regular app switcher
function mapCmdTab(event)
    local flags = event:getFlags()
    local chars = event:getCharacters()
    if chars == "\t" and flags:containExactly{'cmd'} then
        switcher:next()
        return true
    elseif chars == string.char(25) and flags:containExactly{'cmd','shift'} then
        switcher:previous()
        return true
    end
end
tapCmdTab = hs.eventtap.new({hs.eventtap.event.types.keyDown}, mapCmdTab)
tapCmdTab:start()



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
    unmute_title = "HOT MIC",
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
-- Low battery warning < 33%
-----------------------
local batWatcher = nil
local lastBatValue = hs.battery.percentage()
function batPercentageChangedCallback()
    currentBatValue = hs.battery.percentage()

    if hs.battery.isCharging() == true then
        if currentBatValue > 71 and currentBatValue > lastBatValue then
            batteryInfoWindow = hs.alert.show('Battery charged up! (' .. math.floor(tonumber(currentBatValue)) .. '%)', {
                strokeColor = hs.drawing.color.x11.cadetblue,
                fillColor = {["red"]=0.100,["green"]=0.150,["blue"]=0.100,["alpha"]=0.6},
                textColor = hs.drawing.color.x11.cadetblue,
                strokeWidth = 10,
                radius = 10,
                textSize = 50,
                fadeInDuration = 1,
                fadeOutDuration = 1,
                atScreenEdge = 0
            }, 5)
        end
        return
    end

    if currentBatValue < 35 and currentBatValue < lastBatValue then
        batteryInfoWindow = hs.alert.show('Live or let die: ' .. math.floor(tonumber(currentBatValue)) .. '%', {
            strokeColor = hs.drawing.color.x11.goldenrod,
            fillColor = {["red"]=0.400,["green"]=0.200,["blue"]=0.200,["alpha"]=0.7},
            textColor = hs.drawing.color.x11.goldenrod,
            strokeWidth = 10,
            radius = 10,
            textSize = 62,
            fadeInDuration = 1,
            fadeOutDuration = 1,
            atScreenEdge = 0
        }, 5)
    end

    -- For testing alert
    -- if currentBatValue < 73 and currentBatValue <= lastBatValue then
    --     batteryInfoWindow = hs.alert.show('battery is: ' .. math.floor(tonumber(currentBatValue)) .. '%', {
    --         strokeColor = hs.drawing.color.x11.goldenrod,
    --         fillColor = {["red"]=0.400,["green"]=0.200,["blue"]=0.200,["alpha"]=0.7},
    --         textColor = hs.drawing.color.x11.goldenrod,
    --         strokeWidth = 10,
    --         radius = 10,
    --         textSize = 62,
    --         fadeInDuration = 1,
    --         fadeOutDuration = 1,
    --         atScreenEdge = 0
    --     }, 5)
    -- end

    -- isCharging = hs.battery.isCharging()
    -- if isCharging == true then
    --     hs.alert.closeSpecific(batteryInfoWindow, 0)
    --     return
    -- end
    -- if currentBatValue == 100 and lastBatValue == 99 then
    --     hs.notify.new({
    --         title = 'Battery at 100%',
    --         subTitle = 'Fully charged',
    --         alwaysPresent = 1,
    --         autoWithdraw = 0,
    --         withdrawAfter = 0
    --     }):send()
    -- elseif currentBatValue == 30 and lastBatValue > 30 then
    --     hs.notify.new({
    --         title = 'Battery at 30%',
    --         subTitle = 'Notice: Running on battery',
    --         alwaysPresent = 1,
    --         autoWithdraw = 0,
    --         withdrawAfter = 0
    --     }):send()
    -- elseif currentBatValue == 20 and lastBatValue > 20 then
    --     hs.notify.new({
    --         title = 'Battery at 20%',
    --         subTitle = 'Dont sweat it just yet',
    --         alwaysPresent = 1,
    --         autoWithdraw = 0,
    --         withdrawAfter = 0
    --     }):send()
    -- elseif currentBatValue == 15 and lastBatValue > 15 then
    --     hs.notify.new({
    --         title = 'Battery at 15%',
    --         subTitle = 'A slight sweat would be good now',
    --         alwaysPresent = 1,
    --         autoWithdraw = 0,
    --         withdrawAfter = 0
    --     }):send()
    -- elseif currentBatValue == 10 and lastBatValue > 10 then
    --     hs.notify.new({
    --         title = 'Low battery: 10%',
    --         subTitle = 'Time to get serious with that charger',
    --         alwaysPresent = 1,
    --         autoWithdraw = 0,
    --         withdrawAfter = 0
    --     }):send()
    -- elseif currentBatValue < 6 and currentBatValue ~= lastBatValue then
    --     batteryInfoWindow = hs.alert.show('Live or let die: = ' .. currentBatValue .. '%', {
    --         strokeColor = hs.drawing.color.x11.goldenrod,
    --         fillColor = hs.drawing.color.x11.red,
    --         textColor = hs.drawing.color.x11.goldenrod,
    --         strokeWidth = 10,
    --         radius = 10,
    --         textSize = 62,
    --         fadeInDuration = 8,
    --         atScreenEdge = 0
    --     }, 40)
    -- end
    -- if currentBatValue == 7 then
    --     hs.alert.closeAll()
    -- end
    lastBatValue = currentBatValue
end
batWatcher = hs.battery.watcher.new(batPercentageChangedCallback)
batWatcher:start()


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
