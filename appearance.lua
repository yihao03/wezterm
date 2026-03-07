local wezterm = require("wezterm")

local M = {}

function M.apply(config)
	-- Font
	config.font = wezterm.font_with_fallback({
		"Fira Code iScript",
		"Monaspace Xenon",
		"Ubuntu Mono",
	})
	config.font_size = 12
	config.line_height = 1
	config.cell_width = 1

	-- Cursor
	config.default_cursor_style = "BlinkingBar"
	config.cursor_blink_rate = 400
	config.cursor_thickness = "1pt"
	config.force_reverse_video_cursor = false

	-- Tab bar
	config.enable_tab_bar = false
	-- config.tab_bar_at_bottom = true
	-- config.hide_tab_bar_if_only_one_tab = true
	config.use_fancy_tab_bar = true
	config.integrated_title_buttons = { "Close" }

	-- Window
	config.window_padding = {
		left = 4,
		right = 4,
		top = 4,
		bottom = 4,
	}
	config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

	-- Colors & rendering
	config.color_scheme = "rose-pine-moon"
	-- config.color_scheme = "Catppuccin Mocha"
	config.front_end = "WebGpu"
	-- config.win32_system_backdrop = "Mica"
	-- config.window_background_opacity = 0
	config.win32_system_backdrop = "Acrylic"
	config.window_background_opacity = 0.5

	-- Misc
	config.use_ime = true
	config.term = "wezterm"
	config.automatically_reload_config = false
end

return M
