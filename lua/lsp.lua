local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

vim.lsp.config("*", {
    root_markers = { ".git" },
    capabilities = capabilities,
})

vim.lsp.enable({ "pyright", "luals" })
