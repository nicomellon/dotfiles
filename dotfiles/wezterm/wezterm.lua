local wezterm = require("wezterm")

config = {
	automatically_reload_config = true,
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
	window_padding = {
		left = 30,
	},
	color_scheme = "Kanagawa (Gogh)",
	initial_cols = 200,
	initial_rows = 45,
	font_size = 16,
	background = {
		{
			source = {
				File = "/Users/nm/Pictures/nico.jpg",
			},
			hsb = {
				hue = 1.0,
				saturation = 1.02,
				brightness = 0.05,
			},
			width = "100%",
			height = "100%",
		},
		{
			source = {
				Color = "#282c35",
			},
			width = "100%",
			height = "100%",
			opacity = 0.55,
		},
	},
}

return config
