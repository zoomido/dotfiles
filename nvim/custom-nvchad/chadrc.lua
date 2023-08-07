---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "penumbra_dark",
  theme_toggle = { "penumbra_dark", "penumbra_light" },
  hl_override = {
    Normal =  {
      bg = 'none'
    }
  }
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
