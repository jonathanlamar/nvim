-- onedark.nvim
require("onedark").setup({
	-- Main options --
	style = "warmer", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
	transparent = false, -- Show/hide background
	term_colors = true, -- Change terminal color as per the selected theme style
	ending_tildes = true, -- Show the end-of-buffer tildes. By default they are hidden
	-- toggle theme style ---
	-- toggle_style_key = "<leader>to", -- Default keybinding to toggle
	-- toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

	-- Change code style ---
	-- Options are italic, bold, underline, none
	-- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
	code_style = {
		comments = "italic",
		keywords = "none",
		functions = "none",
		strings = "none",
		variables = "none",
	},

	-- Custom Highlights --
	colors = {}, -- Override default colors
	highlights = {
		VertSplit = { fg = "$fg" },
	}, -- Override highlight groups

	-- Plugins Config --
	diagnostics = {
		darker = true, -- darker colors for diagnostic
		undercurl = true, -- use undercurl instead of underline for diagnostics
		background = true, -- use background color for virtual text
	},
})
require("onedark").load()

-- By default, onedark does not export colors for reference elsewhere.
local colors = {
	none = "NONE",
	fg = "#abb2bf",
	bg = "#1e222a",
	black = "#181a1f",
	black_1 = "#1f1f25",
	green = "#98c379",
	green_1 = "#89b06d",
	white = "#dedede",
	white_1 = "#afb2bb",
	white_2 = "#c9c9c9",
	blue = "#61afef",
	blue_1 = "#40d9ff",
	blue_2 = "#1b1f27",
	orange = "#d19a66",
	orange_1 = "#ff9640",
	orange_2 = "#ff8800",
	yellow = "#e5c07b",
	yellow_1 = "#ebae34",
	yellow_2 = "#d1b071",
	red = "#e06c75",
	red_1 = "#ec5f67",
	red_2 = "#ffbba6",
	red_3 = "#cc626a",
	grey = "#5c6370",
	grey_1 = "#4b5263",
	grey_2 = "#777d86",
	grey_3 = "#282c34",
	grey_4 = "#2c323c",
	grey_5 = "#3e4452",
	grey_6 = "#3b4048",
	grey_7 = "#5c5c5c",
	grey_8 = "#252931",
	gold = "#ffcc00",
	cyan = "#56b6c2",
	purple = "#c678dd",
}

return colors
