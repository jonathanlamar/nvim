return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    branch = "main",
    dependencies = {
        -- { "nvim-treesitter/nvim-treesitter-textobjects" },
        { "nvim-treesitter/nvim-treesitter-context" },
    },
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
        -- require("ts_context_commentstring").setup({
        --     enable = true,
        --     enable_autocmd = false,
        -- })
        -- vim.g.skip_ts_context_commentstring_module = true
    end,
}
