local wezterm = require("wezterm")
local is_on_battery = require("utils.isbattery")
local battery_icon = require("utils.battery-icons")

local M = {}

function M.setup()
	wezterm.on("update-right-status", function(window, _)
		local timestamp = wezterm.strftime("%a %b %-d  %H:%M")
		local bat = ""

		if is_on_battery() then
			for _, b in ipairs(wezterm.battery_info()) do
				local charge = b.state_of_charge * 100
				bat = string.format("%s %.0f%%", battery_icon(charge), charge)
			end
		end

		window:set_right_status(wezterm.format({
			{ Foreground = { Color = "#908caa" } },
			{ Text = timestamp .. "   " },
			{ Text = bat },
		}))
	end)
end

function M.apply(config)
	config.tab_bar_at_bottom = true
	config.hide_tab_bar_if_only_one_tab = true
	config.use_fancy_tab_bar = true
	config.integrated_title_buttons = { "Close" }
	config.status_update_interval = 60000
end

return M
