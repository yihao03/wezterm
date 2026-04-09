local wezterm = require("wezterm")

require("events").setup()
require("tabs").setup()

local config = wezterm.config_builder()

require("appearance").apply(config)
require("domains").apply(config)
require("keys").apply(config)
require("tabs").apply(config)

return config
