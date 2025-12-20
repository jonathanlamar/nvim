local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

vim.lsp.config("*", {
    root_markers = { ".git" },
    capabilities = capabilities,
})

vim.lsp.config["pyright"] = {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = {
        "pyrightconfig.json",
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        "Pipfile",
        ".git",
    },
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly",
            },
        },
    },
}

vim.lsp.config["luals"] = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = {
        ".emmyrc.json",
        ".luarc.json",
        ".luarc.jsonc",
        ".luacheckrc",
        ".stylua.toml",
        "stylua.toml",
        "selene.toml",
        "selene.yml",
        ".git",
    },
    settings = {
        Lua = {
            codeLens = { enable = true },
            hint = { enable = true, semicolon = "Disable" },
        },
    },
}

vim.lsp.enable({ "pyright", "luals" })
