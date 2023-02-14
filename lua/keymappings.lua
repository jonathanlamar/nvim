local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

keymap("i", "<Up>", "<Nop>", opts)
keymap("i", "<Down>", "<Nop>", opts)
keymap("i", "<Left>", "<Nop>", opts)
keymap("i", "<Right>", "<Nop>", opts)

keymap("i", "<C-Up>", "<Nop>", opts)
keymap("i", "<C-Down>", "<Nop>", opts)
keymap("i", "<C-Left>", "<Nop>", opts)
keymap("i", "<C-Right>", "<Nop>", opts)

keymap("n", "<Up>", "<Nop>", opts)
keymap("n", "<Down>", "<Nop>", opts)
keymap("n", "<Left>", "<Nop>", opts)
keymap("n", "<Right>", "<Nop>", opts)

keymap("n", "<C-Up>", "<Nop>", opts)
keymap("n", "<C-Down>", "<Nop>", opts)
keymap("n", "<C-Left>", "<Nop>", opts)
keymap("n", "<C-Right>", "<Nop>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-Right>", ":BufferLineMoveNext<cr>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-Left>", ":BufferLineMovePrev<cr>", opts)

-- When using macros, I always accidentally hit shift-Q and go to Ex mode.
keymap("n", "Q", "<Nop>", opts)

-- Add blank line below cursor
keymap("n", "<M-o>", "o<Esc>", opts)

-- Hold on to what you are pasting in visual mode
keymap("v", "p", '"_dP', opts)

-- Window resize a la i3
keymap("n", "<M-j>", ":resize -1<CR>", opts)
keymap("n", "<M-k>", ":resize +1<CR>", opts)
keymap("n", "<M-h>", ":vertical resize -1<CR>", opts)
keymap("n", "<M-l>", ":vertical resize +1<CR>", opts)

-- WHICH KEY
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
    ["e"] = { "<cmd>Neotree toggle<CR>", "explorer" },
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
        h = { "<cmd>Gitsigns preview_hunk<CR>", "preview hunk" },
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
        name = "+LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        c = {
            name = "+Config",
            i = { "<cmd>LspInfo<cr>", "Info" },
            I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
        },
        -- docstring?
        d = {
            name = "+Diagnostics",
            l = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics" },
            d = { "<cmd>lua require('telescope.builtin').diagnostics({bufnr=0})<cr>", "Document Diagnostics" },
            D = { "<cmd>lua require('telescope.builtin').diagnostics()<cr>", "Workspace Diagnostics" },
        },
        f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
        g = {
            name = "+Goto",
            d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
            D = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type Definition" },
            i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation" },
            n = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic" },
            p = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
            -- type definition
        },
        h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover text" },
        --i = { "<cmd>lua organize_imports()<cr>", "Organize imports" },
        -- This may be the same as hover text
        H = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help" },
        l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        q = { "<cmd>lua require('telescope.builtin').quickfix()<cr>", "Quickfix" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        R = { "<cmd>lua require('telescope.builtin').lsp_references()<CR>", "References" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
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
        n = { "<cmd>set nonumber!<CR>", "line-numbers" },
        r = { "<cmd>set norelativenumber!<CR>", "relative line nums" },
        s = { '<cmd>let @/ = ""<CR>', "remove search highlight" },
        t = { "<cmd>ToggleTerm direction=horizontal<CR>", "terminal" },
        T = { "<cmd>ToggleTerm direction=vertical<CR>", "terminal" },
        w = { "<cmd>set nowrap!<CR>", "wrap text" },
        z = { "<cmd>ZenMode<CR>", "zen mode" },
    },
}

local wk = require("which-key")
local wk_opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
}
wk.register(mappings, wk_opts)
