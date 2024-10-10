return {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
        { "dmitmel/cmp-cmdline-history", lazy = true },
        { "f3fora/cmp-spell", lazy = true },
        { "hrsh7th/cmp-buffer", lazy = true },
        { "hrsh7th/cmp-cmdline", lazy = true },
        { "hrsh7th/cmp-nvim-lsp", lazy = true },
        { "hrsh7th/cmp-nvim-lsp-signature-help", lazy = true },
        { "hrsh7th/cmp-nvim-lua", lazy = true },
        { "hrsh7th/cmp-path", lazy = true },
        { "lukas-reineke/cmp-under-comparator", lazy = true }, -- Put python dunder methods later in suggestions list.
        { "onsails/lspkind.nvim", lazy = true }, -- vscode pictograms
        { "uga-rosa/cmp-dictionary", lazy = true },
    },

    config = function()
        local cmp = require("cmp")
        local lspkind = require("lspkind")
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")

        -- Don't show the dumb matching stuff.
        vim.opt.shortmess:append("c")
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

        local setSources = function()
            local context = require("cmp.config.context")
            local s = {}
            if context.in_treesitter_capture("comment") or context.in_syntax_group("Comment") then
                s = cmp.config.sources({
                    { name = "buffer" },
                    { name = "git" },
                    { name = "conventionalcommits" },
                })
            else
                s = cmp.config.sources({
                    { name = "nvim_lsp_signature_help" },
                    { name = "nvim_lsp" },
                }, {
                    { name = "path" },
                    { name = "nvim_lua" },
                }, {
                    {
                        name = "buffer",
                        option = {
                            get_bufnrs = function()
                                local bufs = {}
                                for _, win in ipairs(vim.api.nvim_list_wins()) do
                                    bufs[vim.api.nvim_win_get_buf(win)] = true
                                end
                                return vim.tbl_keys(bufs)
                            end,
                        },
                    },
                })
            end
            return s
        end

        cmp.setup({
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            completion = {
                autocomplete = false,
            },
            mapping = {
                ["<C-e>"] = cmp.mapping(function()
                    if cmp.visible() then
                        cmp.abort()
                    else
                        cmp.complete()
                    end
                end, { "i", "c" }),
                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = false,
                }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                -- For some reason this stopped working :/
                -- ["<C-Space>"] = cmp.mapping.complete(),
            },
            sources = setSources(),
            formatting = {
                format = lspkind.cmp_format({
                    symbol_map = {
                        Copilot = "",
                    },
                    menu = {
                        nvim_lsp_signature_help = "[SIG]",
                        nvim_lsp = "[LSP]",
                        nvim_lua = "[VIM]",
                        path = "[PATH]",
                        luasnip = "[SNIP]",
                        spell = "[SPELL]",
                        dictionary = "[DICT]",
                        buffer = "[BUF]",
                        copilot = "[COPILOT]",
                        cmdline = "[CMD]",
                        cmdline_history = "[HIST]",
                        git = "[GIT]",
                        conventionalcommits = "[CMT]",
                        nvim_lsp_document_symbol = "[DOC]",
                    },
                }),
            },
            sorting = {
                comparators = {
                    cmp.config.compare.scopes,
                    cmp.config.compare.locality,
                    require("cmp-under-comparator").under,
                    cmp.config.compare.recently_used,

                    -- Not sure about these.
                    cmp.config.compare.score,
                    cmp.config.compare.offset,
                },
            },
            view = { entries = { name = "custom", selection_order = "top_down" } },
        })

        cmp.setup.cmdline(":", {
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
                { name = "cmdline_history" },
            }),
            matching = { disallow_symbol_nonprefix_matching = false },
            mapping = cmp.mapping.preset.cmdline({
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<Down>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
                ["<Up>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
            }),
            view = { entries = { name = "custom", selection_order = "near_cursor" } },
        })

        cmp.setup.cmdline({ "/", "?" }, {
            sources = cmp.config.sources({ { name = "nvim_lsp_document_symbol" } }, { { name = "buffer" } }),
            mapping = cmp.mapping.preset.cmdline({
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<Down>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
                ["<Up>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
            }),
            view = { entries = { name = "custom", selection_order = "near_cursor" } },
        })

        cmp.setup.filetype({ "markdown", "text" }, {
            sources = {
                { name = "spell", keyword_length = 4 },
                { name = "dictionary", keyword_length = 4 },
                { name = "buffer", keyword_length = 4 },
            },
        })
    end,
}
