return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    branch = "main",
    config = function()
        local treesitter = require("nvim-treesitter")
        treesitter.install({
            "bash",
            "javascript",
            "json",
            "lua",
            "markdown",
            "markdown_inline",
            "python",
            "terraform",
            "typescript",
            "yaml",
        })
    end,
}
