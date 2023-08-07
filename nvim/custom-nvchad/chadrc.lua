---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "blossom_light",
  theme_toggle = { "blossom_light", "penumbra_dark" },
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
