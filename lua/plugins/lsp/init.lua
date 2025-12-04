vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = true,
})

return {
    { "folke/neodev.nvim" },
    { "hrsh7th/cmp-nvim-lsp" },
    { import = "plugins.lsp" },
}
