-- nvim-cmp setup
local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

-- Don't show the dumb matching stuff.
vim.opt.shortmess:append("c")

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

lspkind.init({
    symbol_map = {
        Copilot = "",
    },
})

cmp.setup({
    completion = {
        -- Remove open paren from completion triggers.
        get_trigger_characters = function(trigger_characters)
            local new_trigger_characters = {}
            for _, char in ipairs(trigger_characters) do
                if char ~= "(" then
                    table.insert(new_trigger_characters, char)
                end
            end
            return new_trigger_characters
        end,
    },

    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    preselect = cmp.PreselectMode.None,

    mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
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
    sources = {
        { name = "nvim_lua" },
        { name = "nvim_lsp_signature_help" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
    },

    formatting = {
        format = lspkind.cmp_format({
            with_text = true,
            menu = {
                nvim_lsp = "[LSP]",
                nvim_lua = "[api]",
                nvim_lsp_signature_help = "[sig]",
                path = "[path]",
                luasnip = "[snip]",
                spell = "[spell]",
                dictionary = "[dict]",
                buffer = "[buf]"
            },
        }),
    },

    sorting = {
        comparators = {
            cmp.config.compare.locality,
            cmp.config.compare.offset,
            cmp.config.compare.score,
            require("cmp-under-comparator").under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
            cmp.config.compare.exact,
        },
    },

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

cmp.setup.filetype({ "markdown", "text" }, {
    sources = {
        { name = "spell", keyword_length = 4 },
        { name = "dictionary", keyword_length = 4 },
        { name = "buffer", keyword_length = 4 },
    },
})

cmp.setup.cmdline("/", {
    sources = cmp.config.sources({ { name = "nvim_lsp_document_symbol" } }, { { name = "buffer" } }),
    mapping = cmp.mapping.preset.cmdline({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Left>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
        ["<Right>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
    }),
})
