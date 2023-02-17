return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        {
            "L3MON4D3/LuaSnip",
            lazy = true,
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
            end,
            dependencies = {
                "rafamadriz/friendly-snippets",
                "saadparwaiz1/cmp_luasnip",
            },
        },
        { "f3fora/cmp-spell", lazy = true },
        { "hrsh7th/cmp-buffer", lazy = true },
        { "hrsh7th/cmp-nvim-lsp", lazy = true },
        { "hrsh7th/cmp-nvim-lsp-signature-help", lazy = true },
        { "hrsh7th/cmp-nvim-lua", lazy = true },
        { "hrsh7th/cmp-path", lazy = true },
        { "lukas-reineke/cmp-under-comparator", lazy = true }, -- Put python dunder methods later in suggestions list.
        { "onsails/lspkind.nvim", lazy = true }, -- vscode pictograms
        { "saadparwaiz1/cmp_luasnip", lazy = true },
        { "uga-rosa/cmp-dictionary", lazy = true },
        { "hrsh7th/cmp-cmdline", lazy = true },
        { "dmitmel/cmp-cmdline-history", lazy = true },
        {
            "zbirenbaum/copilot-cmp",
            event = { "BufRead", "BufNewFile" },
            dependencies = {
                {
                    "zbirenbaum/copilot.lua",
                    config = function()
                        require("copilot").setup()
                    end,
                },
            },
            config = function()
                require("copilot_cmp").setup()
            end,
        },
        {
            "petertriho/cmp-git",
            ft = { "gitcommit", "gitrebase", "octo" },
            dependencies = { "nvim-lua/plenary.nvim" },
            config = function()
                require("cmp_git").setup()
            end,
        },
    },
    config = function()
        -- nvim-cmp setup
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")

        -- Don't show the dumb matching stuff.
        vim.opt.shortmess:append("c")

        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

        cmp.setup({
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            completion = {
                -- Remove open paren and comma from completion triggers.
                get_trigger_characters = function(trigger_characters)
                    local new_trigger_characters = {}
                    for _, char in ipairs(trigger_characters) do
                        if char ~= "(" and char ~= "," then
                            table.insert(new_trigger_characters, char)
                        end
                    end
                    return new_trigger_characters
                end,
                autocomplete = false,
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = false,
                }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
            -- TODO:
            -- Text style suggestions in comments
            sources = cmp.config.sources({
                { name = "nvim_lsp_signature_help" },
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "copilot" },
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
            }),
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
                    },
                }),
            },
            sorting = {
                comparators = {
                    function(...)
                        return require("cmp_buffer"):compare_locality(...)
                    end,
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.locality,
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                    require("cmp-under-comparator").under,
                },
            },
            view = { entries = { name = "custom", selection_order = "near_cursor" } },
            enabled = function()
                -- disable completion in comments
                local context = require("cmp.config.context")
                -- keep command mode completion enabled when cursor is in a comment
                if vim.api.nvim_get_mode().mode == "c" then
                    return true
                else
                    return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
                end
            end,
        })

        cmp.setup.filetype("gitcommit", {
            sources = cmp.config.sources({
                { name = "git" },
                { name = "buffer" },
                { name = "conventionalcommits" },
            }),
        })
        cmp.setup.cmdline(":", {
            confirmation = { completeopt = "menu,menuone,noinsert" },
            sources = cmp.config.sources({
                { name = "cmdline" },
                { name = "cmdline_history" },
                { name = "path" },
            }),
            mapping = cmp.mapping.preset.cmdline({
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<Down>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
                ["<Up>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
            }),
        })
        cmp.setup.filetype({ "markdown", "text" }, {
            sources = {
                { name = "spell", keyword_length = 4 },
                { name = "dictionary", keyword_length = 4 },
                { name = "buffer", keyword_length = 4 },
            },
        })

        cmp.setup.cmdline("/", {
            sources = cmp.config.sources({ { name = "buffer" } }),
            mapping = cmp.mapping.preset.cmdline({
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<Down>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
                ["<Up>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
            }),
        })
    end,
}
