local M = {}

function M.apply(config)
	config.font_size = 12.0
	config.use_ime = true
	config.window_decorations = "RESIZE"
	config.hide_tab_bar_if_only_one_tab = true
	config.show_tab_index_in_tab_bar = true

	config.color_scheme = "Tokyo Night"

	config.window_frame = {
		inactive_titlebar_bg = "none",
		active_titlebar_bg = "none",
	}

	config.colors = {
		tab_bar = {
			background = "none",
		},
	}
end

return M
