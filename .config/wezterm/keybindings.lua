local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

function M.apply(config)
	config.keys = {
		-- Pane splitting
		{ key = "d", mods = "CMD", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "d", mods = "CMD|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

		-- Pane navigation
		{ key = "h", mods = "CMD|OPT", action = act.ActivatePaneDirection("Left") },
		{ key = "j", mods = "CMD|OPT", action = act.ActivatePaneDirection("Down") },
		{ key = "k", mods = "CMD|OPT", action = act.ActivatePaneDirection("Up") },
		{ key = "l", mods = "CMD|OPT", action = act.ActivatePaneDirection("Right") },

		-- Close pane
		{ key = "w", mods = "CMD", action = act.CloseCurrentPane({ confirm = true }) },

		-- Pane resizing
		{ key = "h", mods = "CMD|CTRL", action = act.AdjustPaneSize({ "Left", 5 }) },
		{ key = "j", mods = "CMD|CTRL", action = act.AdjustPaneSize({ "Down", 5 }) },
		{ key = "k", mods = "CMD|CTRL", action = act.AdjustPaneSize({ "Up", 5 }) },
		{ key = "l", mods = "CMD|CTRL", action = act.AdjustPaneSize({ "Right", 5 }) },
	}
end

return M
