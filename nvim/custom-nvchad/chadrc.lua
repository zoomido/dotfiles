---@type ChadrcConfig
local M = {}

--[[ TODO
 * Session management
 * grep visual selection to telescope
 * search inside visual selection
 * git plugin
 * cursorline if needed
 * check old dotfiles for inspiration
--]]

M.ui = {
    theme = "gruvbox",
    theme_toggle = { "gruvbox", "penumbra_dark" },
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
