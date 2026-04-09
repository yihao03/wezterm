local M = {}

function M.apply(config)
	config.set_environment_variables = {
		["TERM_INFO"] = "wezterm",
	}
end

return M
