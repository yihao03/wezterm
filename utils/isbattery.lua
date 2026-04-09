local wezterm = require("wezterm")

local function on_battery()
	for _, b in ipairs(wezterm.battery_info()) do
		if b.state == "Discharging" then
			return true
		end
	end
	return false
end

return on_battery
