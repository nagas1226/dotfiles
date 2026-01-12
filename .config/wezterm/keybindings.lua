local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

function M.apply(config)
	config.keys = {
		-- Pane splitting
		{ key = "d", mods = "CMD", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "d", mods = "CMD|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

		-- Pane navigation (Cmd+h overrides macOS hide window)
		{ key = "h", mods = "CMD", action = act.ActivatePaneDirection("Left") },
		{ key = "j", mods = "CMD", action = act.ActivatePaneDirection("Down") },
		{ key = "k", mods = "CMD", action = act.ActivatePaneDirection("Up") },
		{ key = "l", mods = "CMD", action = act.ActivatePaneDirection("Right") },

		-- Close pane
		{ key = "w", mods = "CMD", action = act.CloseCurrentPane({ confirm = true }) },

		-- Toggle pane zoom
		{ key = "Enter", mods = "CMD", action = act.TogglePaneZoomState },

		-- Pane resizing
		{ key = "h", mods = "CMD|SHIFT", action = act.AdjustPaneSize({ "Left", 3 }) },
		{ key = "j", mods = "CMD|SHIFT", action = act.AdjustPaneSize({ "Down", 3 }) },
		{ key = "k", mods = "CMD|SHIFT", action = act.AdjustPaneSize({ "Up", 3 }) },
		{ key = "l", mods = "CMD|SHIFT", action = act.AdjustPaneSize({ "Right", 3 }) },
	}
end

return M
