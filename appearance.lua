local wezterm = require("wezterm")
local is_on_battery = require("utils.isbattery")

local M = {}

function M.apply(config)
	-- Font
	config.font = wezterm.font_with_fallback({
		{
			family = "Monaspace Neon NF",
			harfbuzz_features = {
				"calt",
				"cv10",
				"ss01",
				"ss02",
				"ss03",
				"ss04",
				"ss05",
				"ss06",
				"ss07",
				"ss08",
				"ss09",
				"ss10",
				"liga",
			},
			-- weight = 500,
		},
		-- "Maple Mono NF",
		-- "Fira Code iScript",
	})
	config.font_size = 12
	config.line_height = 1
	config.cell_width = 1
	config.bold_brightens_ansi_colors = "BrightAndBold"

	-- Window
	config.window_padding = {
		left = 4,
		right = 4,
		top = 4,
		bottom = 4,
	}
	config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

	-- Cursor
	config.cursor_thickness = "1pt"
	config.force_reverse_video_cursor = false

	-- Colors
	config.color_scheme = "rose-pine-moon"

	config.colors = {
		selection_bg = "#b8b8b8",
		selection_fg = "#1a1a1a",
	}
	-- config.color_scheme = "Catppuccin Mocha"

	if not is_on_battery() then
		-- Rendering
		config.front_end = "WebGpu"
		-- config.win32_system_backdrop = "Acrylic"
		-- config.window_background_opacity = 0.7
		config.win32_system_backdrop = "Tabbed"
		config.window_background_opacity = 0

		-- fps
		config.default_cursor_style = "BlinkingBar"
		config.cursor_blink_rate = 400
		config.max_fps = 120
	end

	-- Misc
	config.term = "wezterm"
	config.automatically_reload_config = true
end

return M
