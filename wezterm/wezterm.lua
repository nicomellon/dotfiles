local wezterm = require("wezterm")

config = {
	automatically_reload_config = true,
	color_scheme = "Kanagawa (Gogh)",
	enable_tab_bar = false,
	initial_cols = 200,
	initial_rows = 45,
	font_size = 16,
	window_background_opacity = 0.85,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
	window_padding = {
		left = 30,
	},
}

return config
