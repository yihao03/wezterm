local M = {}

function M.apply(config)
	config.default_domain = "WSL:Ubuntu"
	config.launch_menu = {
		{ label = "PowerShell", args = { "powershell.exe" } },
		{ label = "PowerShell Core", args = { "pwsh.exe" } },
	}
end

return M
