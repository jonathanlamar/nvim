local utils = require("utils")

require("which-key").setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = true, -- adds help for operators like d, y, ...
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true -- bindings for prefixed with g
        }
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+" -- symbol prepended to a group
    },
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
        padding = {2, 2, 2, 2} -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = {min = 4, max = 25}, -- min and max height of the columns
        width = {min = 20, max = 50}, -- min and max width of the columns
        spacing = 3 -- spacing between columns
    },
    hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true -- show help message on the command line when the popup is visible
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false -- use `nowait` when creating keymaps
}

-- Comments
-- vim.api.nvim_set_keymap("n", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap("n", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap("v", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})

local mappings = {
    ["/"] = {"<cmd>Commentary<CR>"                 , "comment"},
    ["e"] = {"<cmd>NERDTreeToggle<CR>"             , "explorer"},
    ["f"] = {"<cmd>Telescope find_files<CR>"       , "search file"},
    ["T"] = {"<cmd>Telescope live_grep<CR>"        , "search text"},
    ["h"] = {"<cmd>split<CR>"                      , "split"},
    ["v"] = {"<cmd>vsplit<CR>"                     , "veritcal split"},
    ["S"] = {"<cmd>tabnew | Startify<CR>"          , "start screen"},

    g = {
        name = "+git",
        a = {"<cmd>Git add .<CR>"                                 , "add all"},
        A = {"<cmd>Git add %<CR>"                                 , "add current"},
        b = {"<cmd>Telescope git_branches<cr>"                    , "checkout branch"},
        B = {"<cmd>lua require\"gitsigns\".blame_line(true)<CR>"  , "blame line"},
        c = {"<cmd>Git commit<CR>"                                , "commit"},
        d = {"<cmd>Gdiffsplit<CR>"                                , "diff split"},
        -- h = {"<cmd>GitGutterLineHighlightsToggle<CR>"             , "highlight hunks"},
        H = {"<cmd>lua require\"gitsigns\".preview_hunk()<CR>"    , "preview hunk"},
        j = {"<cmd>luarequire\"gitsigns\".next_hunk()<CR>"        , "next hunk"},
        k = {"<cmd>lua require\"gitsigns\".prev_hunk()<CR>"       , "prev hunk"},
        l = {"<cmd>Git log<CR>"                                   , "log"},
        o = {"<cmd>Telescope git_status<cr>"                      , "open changed file"},
        p = {"<cmd>Git push<CR>"                                  , "push"},
        P = {"<cmd>Git pull<CR>"                                  , "pull"},
        r = {"<cmd>lua require\"gitsigns\".reset_hunk()<CR>"      , "reset hunk"},
        R = {"<cmd>lua require\"gitsigns\".reset_buffer()<CR>"    , "reset buffer"},
        s = {"<cmd>lua require\"gitsigns\".stage_hunk()<CR>"      , "stage hunk"},
        S = {"<cmd>Gstatus<CR>"                                   , "git status"},
        -- t = {"<cmd>GitGutterSignsToggle<CR>"                      , "toggle signs"},
        u = {"<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>" , "undo stage hunk"},
        v = {"<cmd>GV<CR>"                                        , "view commits"},
        V = {"<cmd>GV!<CR>"                                       , "view buffer commits"},
        w = {"<cmd>GBrowse<CR>"                                   , "view in browser"}
    },

    l = {
        name = "+lsp",
        a = {"<cmd>Lspsaga code_action<cr>"                    , "code action"},
        A = {"<cmd>Lspsaga range_code_action<cr>"              , "selected action"},
        d = {"<Cmd>lua vim.lsp.buf.definition()<CR>"           , "go to definition"},
        D = {"<cmd>Telescope lsp_document_diagnostics<cr>"     , "document diagnostics"},
        f = {"<cmd>Neoformat<cr>"                              , "format buffer"},
        h = {"<cmd>Lspsaga hover_doc<cr>"                      , "hover doc"},
        H = {"<cmd>Lspsaga signature_help<CR>"                 , "signature help"},
        i = {"<cmd>LspInfo<cr>"                                , "info"},
        j = {"<cmd>Lspsaga diagnostic_jump_next<CR>"           , "next diagnostic"},
        k = {"<cmd>Lspsaga diagnostic_jump_prev<CR>"           , "previous diagnostic"},
        L = {"<cmd>Lspsaga show_line_diagnostics<cr>"          , "line diagnostics"},
        p = {"<cmd>Lspsaga preview_definition<cr>"             , "preview definition"},
        q = {"<cmd>Telescope quickfix<cr>"                     , "quickfix"},
        r = {"<cmd>Lspsaga rename<cr>"                         , "rename"},
        R = {"<cmd>lua vim.lsp.buf.references()<CR>"           , "references"},
        t = {"<cmd>vim.lsp.buf.type_definition()<cr>"          , "type definition"},
        x = {"<cmd>cclose<cr>"                                 , "close quickfix"},
        s = {"<cmd>Telescope lsp_document_symbols<cr>"         , "document symbols"},
        S = {"<cmd>Telescope lsp_workspace_symbols<cr>"        , "workspace symbols"}
    },

    s = {
        name = "+search",
        b = {"<cmd>Telescope current_buffer_fuzzy_find<cr>"    , "current buffer"},
        B = {"<cmd>Telescope buffers<cr>"                      , "buffers"},
        c = {"<cmd>Telescope git_commits<cr>"                  , "commits"},
        C = {"<cmd>Telescope git_bcommits<cr>"                 , "buffer commits"},
        d = {"<cmd>Telescope lsp_workspace_diagnostics<cr>"    , "workspace diagnostics"},
        g = {"<cmd>Telescope git_files"                        , "git files"},
        h = {"<cmd>Telescope command_history"                  , "command history"},
        m = {"<cmd>Telescope marks<cr>"                        , "marks"},
        M = {"<cmd>Telescope man_pages<cr>"                    , "man pages"},
        r = {"<cmd>Telescope oldfiles<cr>"                     , "open recent file"},
        R = {"<cmd>Telescope registers<cr>"                    , "registers"},
    },

    t = {
        name = "+toggle",
        c = {"<cmd>TagbarToggle<cr>"           , "tagbar"},
        g = {"<cmd>call GoyoNoLines()<CR>"     , "goyo"},
        n = {"<cmd>set nonumber!<CR>"          , "line-numbers"},
        r = {"<cmd>set norelativenumber!<CR>"  , "relative line nums"},
        s = {"<cmd>let @/ = \"\"<CR>"            , "remove search highlight"},
        t = {"<cmd>call TermToggle(0.3)<CR>"   , "terminal"},
        w = {"<cmd>set nowrap!<CR>"            , "wrap text"}
    }
}

local wk = require("which-key")
wk.register(mappings, opts)
