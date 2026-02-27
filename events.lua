local wezterm = require("wezterm")

local M = {}

function M.setup()
	wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
		local active_pane = tab.active_pane
		local cwd = active_pane.current_working_dir

		if cwd == nil then
			return
		end

		local cwd_str = cwd.file_path or ""

		-- Remove WSL distro prefix
		cwd_str = cwd_str:gsub("^/[^/]+", "", 1)

		-- Remove trailing slash
		if #cwd_str > 1 then
			cwd_str = cwd_str:gsub("/$", "")
		end

		-- Shorten home to ~
		cwd_str = cwd_str:gsub("^/home/[^/]+", "~")
		cwd_str = cwd_str:gsub("^/root", "~")

		if cwd_str == "" then
			cwd_str = "~"
		end

		return cwd_str
	end)
end

return M
