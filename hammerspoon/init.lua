-- Logger example
-- local log = hs.logger.new('Userlog','debug')
-- log.i('Initializing') -- will print "[mymodule] Initializing" to the console

-- listenForKeyPress = hs.eventtap.new({hs.eventtap.event.types.keyDown, hs.eventtap.event.types.systemDefined}, function(event)
--     print('--- hammerspoon console is listening for key presses ---')
--     local type = event:getType()
--     if type == hs.eventtap.event.types.keyDown then
--         print(hs.keycodes.map[event:getKeyCode()])
--     elseif type == hs.eventtap.event.types.systemDefined then
--         local t = event:systemKey()
--         if t.down then
--             print("System key: " .. t.key)
--         end
--     end
-- end)
-- listenForKeyPress:start()


---------------------------
-- Load custom keybindings
---------------------------

-- Define mash/hyper key
mash = { 'shift', 'ctrl', 'cmd' }


-- Send backtick & forwardtick immediately, also make backtick default
hs.hotkey.bind({}, '´', function()
    hs.eventtap.keyStrokes("`")
end)
hs.hotkey.bind({ "shift" }, '´', function()
    hs.eventtap.keyStrokes("´")
end)

-- Send tilde directly
hs.hotkey.bind({ 'alt' }, '¨', function()
    hs.eventtap.keyStrokes("~")
end)

-- Hack to send dollar char
-- hs.hotkey.bind({'alt'}, '$', function()
--     hs.eventtap.keyStrokes("plop")
-- end)


-- Start/switch/hide Kitty
hs.hotkey.bind({}, "§", function()
    local app = hs.application.find('kitty')
    if (app and app:isFrontmost()) then
        app:hide()
    else
        hs.application.open("kitty.app")
    end

    -- print( app:allWindows() );
    -- print( app:title() );
end)

-- Start/switch/hide browser
hs.hotkey.bind({ "cmd" }, "§", function()
    local app = hs.application.find('brave')
    if (app and app:isFrontmost()) then
        app:hide()
    else
        hs.application.open("Brave Browser.app")
    end
end)
-- Start/switch to browser and reload (webdev)
hs.hotkey.bind({ "cmd", "shift" }, "return", function()
    -- hs.eventtap.keyStrokes(":w")
    -- hs.eventtap.keyStroke({}, "return")
    hs.application.open("Brave Browser.app")
    hs.eventtap.keyStroke({ "cmd" }, "2")
    hs.timer.doAfter(0.1, function()
        hs.eventtap.keyStroke({ "cmd" }, "r")
    end)
end)


-- Start/switch/hide alternative browser
hs.hotkey.bind(mash, "l", function()
    local app = hs.application.find('LibreWolf')
    if (app and app:isFrontmost()) then
        app:hide()
    else
        hs.application.open("LibreWolf.app")
    end
end)


-- Start/switch/hide note application
hs.hotkey.bind({ "shift" }, "§", function()
    local app = hs.application.find('Alacritty')
    if (app and app:isFrontmost()) then
        app:hide()
    elseif (app == nil) then
        -- When alacritty is opened, also start a note sync
        -- hs.alert.show("Alacritty first time open")
        local home = hs.fs.pathToAbsolute("~")  -- This gets the path to the user's home directory
        local notesPath = home .. "/private-notes"  -- Append your relative path to it
        local gitSyncPath = home .. "/dotfiles/git-sync.sh"
        hs.task.new("/Applications/Alacritty.app/Contents/MacOS/alacritty", nil, {"--working-directory", notesPath, "--command", gitSyncPath }):start()
        hs.application.open("Alacritty.app")
    else
        hs.application.open("Alacritty.app")
    end
end)
-- Sync notes to git
hs.hotkey.bind(mash, "n", function()
    local home = hs.fs.pathToAbsolute("~")  -- This gets the path to the user's home directory
    local notesPath = home .. "/private-notes"  -- Append your relative path to it
    local gitSyncPath = home .. "/dotfiles/git-sync.sh"

    hs.task.new("/Applications/Alacritty.app/Contents/MacOS/alacritty", nil, { "--hold", "--working-directory", notesPath, "--command", gitSyncPath }):start()
end)


-- Start/switch/hide Spotify
hs.hotkey.bind(mash, "s", function()
    local app = hs.application.find('spotify')
    if (app and app:isFrontmost()) then
        app:hide()
    else
        hs.application.open("Spotify.app")
    end
end)


-- For center screen and make it almost fullscreen
hs.window.animationDuration = 0
Units = {
    fullscreen       = { x = 0.0, y = 0.0, w = 1, h = 1 },
    almostFullscreen = { x = 0.025, y = 0.04, w = 0.946, h = 0.930 },
    centerSmall      = { x = 0.1, y = 0.1, w = 0.8, h = 0.8 },
    leftHalf         = { x = 0, y = 0, w = 0.495, h = 1 },
    rightHalf        = { x = 0.501, y = 0, w = 0.5, h = 1 },
    topHalf          = { x = 0, y = 0, w = 1, h = 0.495 },
    bottomHalf       = { x = 0, y = 0.501, w = 1, h = 0.5 },
    smallMobile      = { x = 0.02, y = 0.02, w = 0.346, h = 0.975 },
    inspectorChrome  = { x = 0.366, y = 0.02, w = 0.61, h = 0.975 }
}
hs.hotkey.bind(mash, 'f', function()
    hs.window.focusedWindow():move(Units.fullscreen, nil, true)
end)
hs.hotkey.bind(mash, 'a', function()
    hs.window.focusedWindow():move(Units.almostFullscreen, nil, true)
end)
hs.hotkey.bind(mash, 'c', function()
    hs.window.focusedWindow():move(Units.centerSmall, nil, true)
end)
hs.hotkey.bind(mash, 'left', function()
    hs.window.focusedWindow():move(Units.leftHalf, nil, true)
end)
hs.hotkey.bind(mash, 'right', function()
    hs.window.focusedWindow():move(Units.rightHalf, nil, true)
end)
hs.hotkey.bind(mash, 'up', function()
    hs.window.focusedWindow():move(Units.topHalf, nil, true)
end)
hs.hotkey.bind(mash, 'down', function()
    hs.window.focusedWindow():move(Units.bottomHalf, nil, true)
end)
-- hs.hotkey.bind(mash, 's', function()
--     hs.window.focusedWindow():move(Units.smallMobile, nil, true)
-- end)
-- hs.hotkey.bind(mash, 'i', function()
--     hs.window.focusedWindow():move(Units.inspectorChrome, nil, true)
-- end)
-- Send mouse away
hs.hotkey.bind(mash, "ö", function()
    hs.mouse.setRelativePosition({ x = 1400, y = 90 })
end)



--------------------------
-- Custom window switcher
--------------------------
-- ALL THIS IS COMMENTED OUT
-- -- set up your windowfilter
-- -- switcher = hs.window.switcher.new() -- default windowfilter: only visible windows, all Spaces
-- -- switcher_browsers = hs.window.switcher.new{'Safari','Google Chrome'} -- specialized switcher for your dozens of browser windows :)
--
-- switcher = hs.window.switcher.new(hs.window.filter.new():setCurrentSpace(nil):setDefaultFilter { visible = true, hasTitlebar = true, allowTitles = 1}) -- no hidden/minimized windows, all Spaces
-- switcher.ui.showTitles = false
-- switcher.ui.backgroundColor = { 0.1, 0.1, 0.1, 0.3 }
-- switcher.ui.selectedThumbnailSize = 300
-- switcher.ui.showSelectedTitle = false
-- switcher.ui.fontName = 'Helvetica'
-- -- hs.window.animationDuration = 0
--
-- -- -- bind to hotkeys; WARNING: at least one modifier key is required!
-- -- hs.hotkey.bind('alt','tab','Next window',function()switcher:next()end)
-- -- hs.hotkey.bind('alt-shift','tab','Prev window',function()switcher:previous()end)
-- -- Override cmd-tab macos regular app switcher
-- function mapCmdTab(event)
--     local flags = event:getFlags()
--     local chars = event:getCharacters()
--     if chars == "\t" and flags:containExactly { 'cmd' } then
--         switcher:next()
--         return true
--     elseif chars == string.char(25) and flags:containExactly { 'cmd', 'shift' } then
--         switcher:previous()
--         return true
--     end
-- end
--
-- tapCmdTab = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, mapCmdTab)
-- tapCmdTab:start()
-- COMMENTS STOPS HERE



---------------------------
-- Load ControlEscape plug
---------------------------
hs.loadSpoon('ControlEscape'):start() -- Load Hammerspoon bits from https://github.com/jasonrudolph/ControlEscape.spoon


---------------------
-- Global Mute spoon
---------------------
hs.loadSpoon("GlobalMute")
spoon.GlobalMute:bindHotkeys({
    toggle = { { "ctrl", "cmd", "shift" }, "z" }
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


----------------------------------------------------------
-- Battery warnings and info with popup and menu bar icon
----------------------------------------------------------
lastBatValue = hs.battery.percentage()
batteryMenuBar = hs.menubar.new(true, 'batteryMenuBar')
batteryWatcher = hs.battery.watcher.new(function()
    currentBatValue = hs.battery.percentage()
    menuBatteryTitle = hs.styledtext.new(math.floor(currentBatValue) .. '%')
    batteryMenuBar:setTitle(menuBatteryTitle)

    -- For testing
    -- batteryInfoWindow = hs.alert.show('Battery TEST currentBatValue: ' .. currentBatValue .. ', lastBatValue: ' .. lastBatValue, {
    --     strokeColor = hs.drawing.color.x11.cadetblue,
    --     fillColor = {["red"]=0.100,["green"]=0.150,["blue"]=0.100,["alpha"]=0.6},
    --     textColor = hs.drawing.color.x11.cadetblue,
    --     strokeWidth = 10,
    --     radius = 10,
    --     textSize = 50,
    --     fadeInDuration = 1,
    --     fadeOutDuration = 1,
    --     atScreenEdge = 0
    -- }, 5)
    -- if currentBatValue ~= lastBatValue then
    --     batteryInfoWindow = hs.alert.show('Live or let die: ' .. math.floor(tonumber(currentBatValue)) .. '%', {
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
    -- END TESTING

    if hs.battery.isCharging() == true then
        if currentBatValue > 71 and currentBatValue > lastBatValue then
            batteryInfoWindow = hs.alert.show('Battery charged up! (' .. math.floor(tonumber(currentBatValue)) .. '%)', {
                strokeColor = hs.drawing.color.x11.cadetblue,
                fillColor = { ["red"] = 0.100, ["green"] = 0.150, ["blue"] = 0.100, ["alpha"] = 0.6 },
                textColor = hs.drawing.color.x11.cadetblue,
                strokeWidth = 10,
                radius = 10,
                textSize = 50,
                fadeInDuration = 1,
                fadeOutDuration = 1,
                atScreenEdge = 0
            }, 5)
        end
        currentBatteryTitle = batteryMenuBar:title()
        batteryMenuBar:setTitle(currentBatteryTitle .. '⚡️')
        return
    end

    -- Will show popup first time battery hits specified values
    if (currentBatValue == 50 or currentBatValue == 49 or currentBatValue == 40 or currentBatValue == 39) and currentBatValue < lastBatValue then
        batteryInfoWindow = hs.alert.show('🔋 ' .. math.floor(tonumber(currentBatValue)) .. '%', {
            strokeColor = hs.drawing.color.x11.silver,
            fillColor = { ["red"] = 0.400, ["green"] = 0.350, ["blue"] = 0.350, ["alpha"] = 0.7 },
            textColor = hs.drawing.color.x11.silver,
            strokeWidth = 10,
            radius = 10,
            textSize = 62,
            fadeInDuration = 1,
            fadeOutDuration = 1,
            atScreenEdge = 0
        }, 5)
    end

    -- Will show popup every time battery goes down by 1% and charge is less than 35%
    if currentBatValue < 35 and currentBatValue < lastBatValue then
        batteryInfoWindow = hs.alert.show('🪫 Live or let die: ' .. math.floor(tonumber(currentBatValue)) .. '%', {
            strokeColor = hs.drawing.color.x11.goldenrod,
            fillColor = { ["red"] = 0.400, ["green"] = 0.200, ["blue"] = 0.200, ["alpha"] = 0.7 },
            textColor = hs.drawing.color.x11.goldenrod,
            strokeWidth = 10,
            radius = 10,
            textSize = 62,
            fadeInDuration = 1,
            fadeOutDuration = 1,
            atScreenEdge = 0
        }, 5)
        menuBatteryTitle = hs.styledtext.new(math.floor(currentBatValue) .. '%', {
            color = { red = 1, green = 0.5, blue = 0.5 },
        })
    end

    lastBatValue = currentBatValue
end):start()


-------------------------------------------------------
-- Change Kitty colors based on Mac OS light/dark mode
-------------------------------------------------------
function isDarkModeEnabled()
    local _, res = hs.osascript.javascript([[
    Application("System Events").appearancePreferences.darkMode()
    ]])

    return res == true -- getting nil here sometimes
end

cb = function(observedNotificationName)
    local isDarkMode = isDarkModeEnabled()

    print("theme changed. Dark mode: " .. tostring(isDarkMode))

    -- local command = "base16-humanoid-light"
    local command = "base16-atelier-estuary-light"
    if isDarkMode then
        command = "base16-ashes"
    else
        -- command = "base16-humanoid-light"
        -- remove this else statement if theme changing works
    end
    hs.execute(command, true)
end

notificationName = "AppleInterfaceThemeChangedNotification"
appearanceWatcher = hs.distributednotifications.new(cb, notificationName, nil)
appearanceWatcher:start()
