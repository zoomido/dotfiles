-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

--
-- Custom settings here
--

config.send_composed_key_when_left_alt_is_pressed = true -- default false
config.send_composed_key_when_right_alt_is_pressed = false -- default true

config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- config.color_scheme = 'AdventureTime'
config.font = wezterm.font 'IosevkaTerm Nerd Font'
config.font_size = 22

--
-- and finally, return the configuration to wezterm
return config
