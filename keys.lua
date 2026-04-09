local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

function M.apply(config)
	-- split panes, imitates neovim keybindings
	local multiplexing_keys = {
		{
			key = "-",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "|",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "|",
			mods = "CTRL|SHIFT|ALT",
			action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "h",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ActivatePaneDirection("Left"),
		},
		{
			key = "l",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ActivatePaneDirection("Right"),
		},
		{
			key = "j",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ActivatePaneDirection("Down"),
		},
		{
			key = "k",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ActivatePaneDirection("Up"),
		},
	}

	-- update copy mode to behave more like vim/lazy
	local copy_mode_keys = {
		copy_mode = {
			{
				key = "a",
				mods = "NONE",
				action = act.Multiple({
					{ CopyMode = "MoveToScrollbackBottom" },
					{ CopyMode = "Close" },
				}),
			},
		},
	}

	config.keys = config.keys or {}
	-- register all key bindings
	local all_key_bindings = { copy_mode_keys, multiplexing_keys }
	for _, bindings in ipairs(all_key_bindings) do
		for _, key in ipairs(bindings) do
			table.insert(config.keys, key)
		end
	end

	config.mouse_bindings = {
		{
			event = { Drag = { streak = 1, button = "Right" } },
			action = wezterm.action.StartWindowDrag,
		},
	}
end

return M
