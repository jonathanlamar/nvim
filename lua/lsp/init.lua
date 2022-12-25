-- LSP settings.
-- TODO: Factor this out to imported files.

-- Setup neovim lua configuration
require("neodev").setup()

-- Turn on lsp status information
require("fidget").setup()

-- Setup mason so it can manage external tooling
require("mason").setup()

require("lsp.mason")
require("lsp.cmp")
require("lsp.null-ls")

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
})
