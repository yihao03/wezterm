local function get_battery_icon(percentage)
	local icons = {
		"󰁺", -- 0-10%
		"󰁻", -- 10-20%
		"󰁼", -- 20-30%
		"󰁽", -- 30-40%
		"󰁾", -- 50-60%
		"󰁿", -- 60-70%
		"󰂀", -- 70-80%
		"󰂁", -- 80-90%
		"󰂂", -- 90-100%
		"󰁹", -- full
	}

	local index = math.ceil(percentage / 10)
	return icons[index] or icons[#icons]
end

return get_battery_icon
