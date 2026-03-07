local M = {}

function M.apply(config)
	-- config.default_prog = { "wsl.exe", "--distribution", "Ubuntu", "--cd", "~" }
	config.default_domain = "WSL:Ubuntu"
end

return M
