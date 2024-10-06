return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "folke/neodev.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("mason").setup() -- Setup mason so it can manage external tooling
        require("neodev").setup() -- Setup neovim lua configuration

        local mason_lspconfig = require("mason-lspconfig")

        -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

        local servers = {
            pyright = {},
            ts_ls = {},
            lua_ls = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                },
            },
            terraformls = {},
            -- Do not set up scala here.  That is handled in scala.lua
        }

        mason_lspconfig.setup({
            ensure_installed = vim.tbl_keys(servers),
        })

        --  This function gets run when an LSP connects to a particular buffer.
        local on_attach = function(client, bufnr)
            vim.api.nvim_create_autocmd("CursorHold", {
                buffer = bufnr,
                callback = function()
                    local opts = {
                        focusable = false,
                        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                        border = "rounded",
                        source = "always",
                        prefix = " ",
                        scope = "cursor",
                    }
                    vim.diagnostic.open_float(nil, opts)
                end,
            })

            if client.name == "lua_ls" then
                client.server_capabilities.documentFormattingProvider = false
            end
        end

        mason_lspconfig.setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = servers[server_name],
                })
            end,
        })
    end,
}
