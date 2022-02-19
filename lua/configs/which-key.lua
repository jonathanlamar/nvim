require("which-key").setup({
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false, -- adds help for operators like d, y, ...
            motions = false, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
        -- Kinda dumb feature
        -- spelling = {
        -- 	enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        -- 	suggestions = 20, -- how many suggestions should be shown in the list?
        -- },
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- eLxtra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
    },
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
})

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
}

function _G.close_all_other_buffers()
    vim.cmd(":BufferLineCloseLeft")
    vim.cmd(":BufferLineCloseRight")
end

local mappings = {
    -- This doesn't work for some reason
    -- ["/"] = { '<cmd>lua require("Comment.api").toggle_current_linewise()<CR>', "Comment" },
    ["a"] = { "<cmd>Alpha<CR>", "Start screen" },
    ["b"] = {
        "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
        "Buffers",
    },
    ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
    ["C"] = { "<cmd>lua close_all_other_buffers()<cr>", "Close all other buffers" },
    ["e"] = { "<cmd>CocCommand explorer<CR>", "explorer" },
    ["f"] = { "<cmd>Telescope find_files<CR>", "Search file" },
    ["T"] = { "<cmd>Telescope live_grep<CR>", "Search text" },
    ["h"] = { "<cmd>split<CR>", "Split" },
    ["v"] = { "<cmd>vsplit<CR>", "Veritcal split" },

    g = {
        name = "+Git",
        A = { "<cmd>Git add .<CR>", "add all" },
        a = { "<cmd>Git add %<CR>", "add current" },
        b = { "<cmd>Telescope git_branches<cr>", "checkout branch" },
        B = { "<cmd>Gitsigns blame_line<CR>", "blame line" },
        c = { "<cmd>Git commit<CR>", "commit" },
        d = { "<cmd>Gdiffsplit<CR>", "diff split" },
        H = { "<cmd>Gitsigns preview_hunk<CR>", "preview hunk" },
        j = { "<cmd>Gitsigns next_hunk<CR>", "next hunk" },
        k = { "<cmd>Gitsigns prev_hunk<CR>", "prev hunk" },
        l = { "<cmd>Git log<CR>", "log" },
        o = { "<cmd>Telescope git_status<cr>", "open changed file" },
        p = { "<cmd>Git push<CR>", "push" },
        P = { "<cmd>Git pull<CR>", "pull" },
        r = { "<cmd>Gitsigns reset_hunk<CR>", "reset hunk" },
        R = { "<cmd>Gitsigns reset_buffer<CR>", "reset buffer" },
        s = { "<cmd>Gitsigns stage_hunk<CR>", "stage hunk" },
        S = { "<cmd>Gstatus<CR>", "git status" },
        u = { "<cmd>Gitsigns undo_stage_hunk<CR>", "undo stage hunk" },
        v = { "<cmd>GV<CR>", "view commits" },
        V = { "<cmd>GV!<CR>", "view buffer commits" },
        w = { "<cmd>GBrowse<CR>", "view in browser" },
    },

    l = {
        name = "+lsp",
        a = { "<cmd>CocAction<cr>", "action" },
        C = { "<cmd>CocConfig<cr>", "config" },
        c = { "<cmd>CocList commands<cr>", "commands" },
        d = { "<cmd>CocList diagnostics<cr>", "diagnostics" },
        f = { "<Plug>(coc-format)", "format" },
        g = {
            name = "+goto",
            d = { "<Plug>(coc-definition)", "definition" },
            D = { "<Plug>(coc-declaration)", "declaration" },
            i = { "<Plug>(coc-implementation)", "implementation" },
            n = { "<Plug>(coc-diagnostic-next)", "next diagnostic" },
            N = { "<Plug>(coc-diagnostic-next-error)", "next error" },
            p = { "<Plug>(coc-diagnostic-prev)", "prev diagnostic" },
            P = { "<Plug>(coc-diagnostic-prev-error)", "prev error" },
            t = { "<Plug>(coc-type-definition)", "type definition" },
        },
        h = { "<cmd>call Coc_show_documentation()<cr>", "hover" },
        H = { "<Plug>(coc-float-hide)", "hide" },
        i = { "<cmd>CocCommand python.sortImports<cr>", "organize imports" },
        k = { "<Plug>(coc-refactor)", "refactor" },
        O = { "<cmd>CocList outline<cr>", "outline" },
        r = { "<Plug>(coc-rename)", "rename" },
        R = { "<Plug>(coc-references)", "references" },
        U = { "<cmd>CocUpdate<cr>", "update CoC" },
    },

    p = {
        name = "+Packer",
        c = { "<cmd>PackerCompile<cr>", "Compile" },
        i = { "<cmd>PackerInstall<cr>", "Install" },
        s = { "<cmd>PackerSync<cr>", "Sync" },
        S = { "<cmd>PackerStatus<cr>", "Status" },
        u = { "<cmd>PackerUpdate<cr>", "Update" },
    },

    s = {
        name = "+Search",
        b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "current buffer" },
        B = { "<cmd>Telescope buffers<cr>", "buffers" },
        c = { "<cmd>Telescope git_commits<cr>", "commits" },
        C = { "<cmd>Telescope git_bcommits<cr>", "buffer commits" },
        d = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "workspace diagnostics" },
        g = { "<cmd>Telescope git_files", "git files" },
        h = { "<cmd>Telescope command_history", "command history" },
        m = { "<cmd>Telescope marks<cr>", "marks" },
        M = { "<cmd>Telescope man_pages<cr>", "man pages" },
        r = { "<cmd>Telescope oldfiles<cr>", "open recent file" },
        R = { "<cmd>Telescope registers<cr>", "registers" },
    },

    t = {
        name = "Toggle",
        c = { "<cmd>TagbarToggle<cr>", "tagbar" },
        n = { "<cmd>set nonumber!<CR>", "line-numbers" },
        r = { "<cmd>set norelativenumber!<CR>", "relative line nums" },
        s = { '<cmd>let @/ = ""<CR>', "remove search highlight" },
        t = { "<cmd>ToggleTerm direction=vertical<CR>", "terminal" },
        T = { "<cmd>ToggleTerm direction=horizontal<CR>", "terminal" },
        w = { "<cmd>set nowrap!<CR>", "wrap text" },
        z = { "<cmd>ZenMode<CR>", "zen mode" },
    },
}

local wk = require("which-key")
wk.register(mappings, opts)
