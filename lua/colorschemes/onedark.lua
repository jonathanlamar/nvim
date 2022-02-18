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
        NormalNC = { fg = "$fg", bg = "#2c2d31" },
        NonTextNC = { fg = "NONE", bg = "#2c2d31" },
        EndOfBuffer = { bg = "NONE" },
        SignColumn = { bg = "NONE" },
        LspReferenceRead = { fmt = "none", bg = "#2c2d31" },
        LspReferenceWrite = { fmt = "none", bg = "#2c2d31" },
        LspReferenceText = { fmt = "none", bg = "#2c2d31" },
        NvimTreeVertSplit = { fg = "$fg" },
        NvimTreeNormal = { bg = "NONE" },
        NvimTreeEndOfBuffer = { bg = "NONE" },
	}, -- Override highlight groups

	-- Plugins Config --
	diagnostics = {
		darker = true, -- darker colors for diagnostic
		undercurl = true, -- use undercurl instead of underline for diagnostics
		background = true, -- use background color for virtual text
	},
})
