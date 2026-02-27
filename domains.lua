local M = {}

function M.apply(config)
	config.wsl_domains = {
		{
			name = "WSL:Ubuntu",
			distribution = "Ubuntu",
			default_cwd = "~",
		},
	}
	config.default_domain = "WSL:Ubuntu"
end

return M
