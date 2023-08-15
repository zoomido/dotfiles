---@type ChadrcConfig
local M = {}

--[[ TODO
 * git plugin
 * cursorline if needed
 * grep visual selection to telescope
 * check old dotfiles for inspiration
 X Session management
 X search inside visual selection
--]]

M.ui = {
    theme = "everforest_light",
    theme_toggle = { "everforest_light", "penumbra_dark" },
    hl_override = {
        Normal =  {
            bg = 'none'
        },
    },
    statusline = {
        theme = "default",
    }
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
