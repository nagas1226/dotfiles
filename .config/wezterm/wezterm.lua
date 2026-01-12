local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.automatically_reload_config = true

require("appearance").apply(config)
require("keybindings").apply(config)

return config
