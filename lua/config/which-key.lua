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
        separator = "", -- symbol used between a key and it's label
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
    ["c"] = {"<cmd>Commentary<CR>"                 , "comment"},
    ["b"] = {"<cmd>BufferClose!<CR>"               , "Close Buffer" },
    ["B"] = {"<cmd>BufferCloseAllButCurrent<cr>"   , "Close all but current"},
    ["e"] = {"<cmd>CocCommand explorer<CR>"        , "explorer"},
    ["f"] = {"<cmd>Telescope find_files<CR>"       , "search file"},
    ["T"] = {"<cmd>Telescope live_grep<CR>"        , "search text"},
    ["h"] = {"<cmd>split<CR>"                      , "split"},
    ["v"] = {"<cmd>vsplit<CR>"                     , "veritcal split"},
    ["S"] = {"<cmd>tabnew | Startify<CR>"          , "start screen"},

    g = {
        name = "+git",
        A = {"<cmd>Git add .<CR>"                                 , "add all"},
        a = {"<cmd>Git add %<CR>"                                 , "add current"},
        b = {"<cmd>Telescope git_branches<cr>"                    , "checkout branch"},
        B = {"<cmd>Gitsigns blame_line<CR>"                       , "blame line"},
        c = {"<cmd>Git commit<CR>"                                , "commit"},
        d = {"<cmd>Gdiffsplit<CR>"                                , "diff split"},
        H = {"<cmd>Gitsigns preview_hunk<CR>"                     , "preview hunk"},
        j = {"<cmd>Gitsigns next_hunk<CR>"                        , "next hunk"},
        k = {"<cmd>Gitsigns prev_hunk<CR>"                        , "prev hunk"},
        l = {"<cmd>Git log<CR>"                                   , "log"},
        o = {"<cmd>Telescope git_status<cr>"                      , "open changed file"},
        p = {"<cmd>Git push<CR>"                                  , "push"},
        P = {"<cmd>Git pull<CR>"                                  , "pull"},
        r = {"<cmd>Gitsigns reset_hunk<CR>"                       , "reset hunk"},
        R = {"<cmd>Gitsigns reset_buffer<CR>"                     , "reset buffer"},
        s = {"<cmd>Gitsigns stage_hunk<CR>"                       , "stage hunk"},
        S = {"<cmd>Gstatus<CR>"                                   , "git status"},
        u = {"<cmd>Gitsigns undo_stage_hunk<CR>"                  , "undo stage hunk"},
        v = {"<cmd>GV<CR>"                                        , "view commits"},
        V = {"<cmd>GV!<CR>"                                       , "view buffer commits"},
        w = {"<cmd>GBrowse<CR>"                                   , "view in browser"}
    },

    l = {
        name = "+lsp",
        a = {'<cmd>CocAction<cr>'                   , 'action'},
        C = {'<cmd>CocConfig<cr>'                   , 'config'},
        c = {'<cmd>CocList commands<cr>'            , 'commands'},
        d = {'<cmd>Pydocstring<cr>'                 , 'docstring'}, -- TODO: Use coc for this
        D = {'<cmd>CocList diagnostics<cr>'         , 'diagnostics'},
        e = {'<cmd>CocList extensions<cr>'          , 'extensions'},
        f = {'<Plug>(coc-format)'                   , 'format'},
        F = {'<Plug>(coc-format-selected)'          , 'format selected'},
        g = {
            name = '+goto',
            d = {'<Plug>(coc-definition)'           , 'definition'},
            D = {'<Plug>(coc-declaration)'          , 'declaration'},
            R = {'<Plug>(coc-references)'           , 'references'},
            i = {'<Plug>(coc-implementation)'       , 'implementation'},
            n = {'<Plug>(coc-diagnostic-next)'      , 'next diagnostic'},
            N = {'<Plug>(coc-diagnostic-next-error)', 'next error'},
            p = {'<Plug>(coc-diagnostic-prev)'      , 'prev diagnostic'},
            P = {'<Plug>(coc-diagnostic-prev-error)', 'prev error'},
            t = {'<Plug>(coc-type-definition)'      , 'type definition'},
        },
        h = {'<Plug>(coc-float-hide)'               , 'hide'},
        j = {'<Plug>(coc-float-jump)'               , 'float jump'},
        o = {'<Plug>(coc-openlink)'                 , 'open link'},
        O = {'<cmd>CocList outline<cr>'             , 'outline'},
        r = {'<Plug>(coc-rename)'                   , 'rename'},
        R = {'<Plug>(coc-refactor)'                 , 'refactor'},
        s = {'<cmd>CocList -I symbols<cr>'          , 'references'},
        u = {'<cmd>CocListResume<cr>'               , 'resume list'},
        U = {'<cmd>CocUpdate<cr>'                   , 'update CoC'},
        z = {'<cmd>CocDisable<cr>'                  , 'disable CoC'},
        Z = {'<cmd>CocEnable<cr>'                   , 'enable CoC'}
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
        n = {"<cmd>set nonumber!<CR>"          , "line-numbers"},
        r = {"<cmd>set norelativenumber!<CR>"  , "relative line nums"},
        s = {"<cmd>let @/ = \"\"<CR>"          , "remove search highlight"},
        t = {"<cmd>call TermToggle(0.3)<CR>"   , "terminal"},
        w = {"<cmd>set nowrap!<CR>"            , "wrap text"},
        z = {"<cmd>ZenMode<CR>"                , "zen mode"}
    }
}

local wk = require("which-key")
wk.register(mappings, opts)
