local wezterm = require("wezterm")

local M = {}

function M.apply(config)
	-- Font
	config.font = wezterm.font_with_fallback({
		"Monaspace Xenon",
		"Fira Code iScript",
		"Fire Code",
	})
	config.font_size = 13
	config.line_height = 1.2
	config.cell_width = 0.9

	-- Cursor
	config.default_cursor_style = "BlinkingBar"
	config.cursor_blink_rate = 400
	config.cursor_thickness = "1pt"
	config.force_reverse_video_cursor = false

	-- Tab bar
	config.enable_tab_bar = true
	-- config.tab_bar_at_bottom = true
	-- config.hide_tab_bar_if_only_one_tab = true
	config.use_fancy_tab_bar = true
	config.integrated_title_buttons = { "Close" }

	-- Window
	config.window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	}
	config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
	config.window_background_opacity = 0

	-- Colors & rendering
	config.color_scheme = "rose-pine-moon"
	-- config.color_scheme = "Catppuccin Mocha"
	config.front_end = "OpenGL"
	config.win32_system_backdrop = "Mica"

	-- Misc
	config.use_ime = true
	config.term = "xterm-256color"
	config.automatically_reload_config = true
end

return M
