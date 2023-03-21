return {
    "rebelot/kanagawa.nvim",
    lazy = true,
    config = function()
        local theme = "wave"
        local colors = require("kanagawa.colors").setup({ theme = theme })

        require("kanagawa").setup({
            theme = theme,
            compile = true,
            undercurl = false,
            globalStatus = true,
            transparent = false,
            dimInactive = true, -- dim inactive window `:h hl-NormalNC`
            colors = {},
            overrides = function()
                return {
                    WinSeparator = { fg = colors.palette.oldWhite },
                    NeoTreeDirectoryIcon = { link = "NvimTreeFolderIcon" },
                    NeoTreeDirectoryName = { link = "NvimTreeFolderName" },
                    NeoTreeSymbolicLinkTarget = { link = "NvimTreeSymlink" },
                    NeoTreeRootName = { link = "NvimTreeRootFolder" },
                    NeoTreeFileNameOpened = { link = "NvimTreeOpenedFile" },
                }
            end,
        })
    end,
}
