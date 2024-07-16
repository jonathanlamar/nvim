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

-- I'd prefer keeping all of these settings within the which-key framework, but these are too useful:
vim.keymap.set("n", "K", ":Lspsaga hover_doc<cr>", opts)
vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)

vim.keymap.set("v", "<C-p>", ":ToggleTermSendVisualSelection<cr>", opts)
vim.keymap.set("n", "<C-p>", ":ToggleTermSendCurrentLine<cr>", opts)

-- WHICH KEY
function _G.close_all_other_buffers()
    vim.cmd(":BufferLineCloseLeft")
    vim.cmd(":BufferLineCloseRight")
end

local mappings = {
    { "<leader>a", "<cmd>Alpha<CR>", desc = "Start screen", nowait = false, remap = false },
    {
        "<leader>b",
        "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
        desc = "Buffers",
        nowait = false,
        remap = false,
    },
    { "<leader>c", "<cmd>Bdelete!<CR>", desc = "Close Buffer", nowait = false, remap = false },
    {
        "<leader>C",
        "<cmd>lua close_all_other_buffers()<cr>",
        desc = "Close all other buffers",
        nowait = false,
        remap = false,
    },
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "explorer", nowait = false, remap = false },
    {
        "<leader>E",
        "<cmd>lua require('oil').toggle_float()<cr>",
        desc = "Edit directory files",
        nowait = false,
        remap = false,
    },
    { "<leader>f", "<cmd>Telescope find_files<CR>", desc = "Search file", nowait = false, remap = false },

    { "<leader>g", group = "Git", nowait = false, remap = false },
    { "<leader>ga", "<cmd>Git add %<CR>", desc = "add current", nowait = false, remap = false },
    { "<leader>gA", "<cmd>Git add .<CR>", desc = "add all", nowait = false, remap = false },
    { "<leader>gb", "<cmd>Gitsigns blame_line<CR>", desc = "blame line", nowait = false, remap = false },
    { "<leader>gB", "<cmd>Git blame<CR>", desc = "blame buffer", nowait = false, remap = false },
    { "<leader>gc", "<cmd>Git commit<CR>", desc = "commit", nowait = false, remap = false },
    { "<leader>gC", "<cmd>Telescope git_branches<cr>", desc = "checkout branch", nowait = false, remap = false },
    { "<leader>gd", "<cmd>Gdiffsplit<CR>", desc = "diff split", nowait = false, remap = false },
    { "<leader>gh", "<cmd>Gitsigns preview_hunk<CR>", desc = "preview hunk", nowait = false, remap = false },
    { "<leader>gj", "<cmd>Gitsigns next_hunk<CR>", desc = "next hunk", nowait = false, remap = false },
    { "<leader>gk", "<cmd>Gitsigns prev_hunk<CR>", desc = "prev hunk", nowait = false, remap = false },
    { "<leader>gl", "<cmd>Git log<CR>", desc = "log", nowait = false, remap = false },
    { "<leader>gm", "<cmd>Git mergetool", desc = "merge tool", nowait = false, remap = false },
    { "<leader>gp", "<cmd>Git push<CR>", desc = "push", nowait = false, remap = false },
    { "<leader>gP", "<cmd>Git pull<CR>", desc = "pull", nowait = false, remap = false },
    { "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", desc = "reset hunk", nowait = false, remap = false },
    { "<leader>gR", "<cmd>Gitsigns reset_buffer<CR>", desc = "reset buffer", nowait = false, remap = false },
    { "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", desc = "stage hunk", nowait = false, remap = false },
    { "<leader>gS", "<cmd>Telescope git_status<cr>", desc = "status", nowait = false, remap = false },
    { "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>", desc = "undo stage hunk", nowait = false, remap = false },
    { "<leader>gv", "<cmd>GV!<CR>", desc = "view buffer commits", nowait = false, remap = false },
    { "<leader>gV", "<cmd>GV<CR>", desc = "view commits", nowait = false, remap = false },

    { "<leader>h", "<cmd>split<CR>", desc = "Split", nowait = false, remap = false },

    { "<leader>l", group = "LSP", nowait = false, remap = false },
    { "<leader>la", "<cmd>Lspsaga code_action<cr>", desc = "Code Action", nowait = false, remap = false },
    { "<leader>lA", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action", nowait = false, remap = false },

    { "<leader>lc", group = "Config", nowait = false, remap = false },
    { "<leader>lci", "<cmd>LspInfo<cr>", desc = "Info", nowait = false, remap = false },
    { "<leader>lcI", "<cmd>LspInstallInfo<cr>", desc = "Installer Info", nowait = false, remap = false },

    { "<leader>ld", group = "Diagnostics", nowait = false, remap = false },
    {
        "<leader>ldD",
        "<cmd>lua require('telescope.builtin').diagnostics()<cr>",
        desc = "Workspace Diagnostics",
        nowait = false,
        remap = false,
    },
    {
        "<leader>ldd",
        "<cmd>lua require('telescope.builtin').diagnostics({bufnr=0})<cr>",
        desc = "Document Diagnostics",
        nowait = false,
        remap = false,
    },
    {
        "<leader>ldl",
        "<cmd>lua vim.diagnostic.open_float()<CR>",
        desc = "Line Diagnostics",
        nowait = false,
        remap = false,
    },

    { "<leader>lf", "<cmd>Format<cr>", desc = "Format", nowait = false, remap = false },

    { "<leader>lg", group = "Goto", nowait = false, remap = false },
    { "<leader>lgd", "<cmd>Lspsaga goto_definition<CR>", desc = "Definition(s)", nowait = false, remap = false },
    { "<leader>lgD", "<cmd>Lspsaga peek_definition<CR>", desc = "Type Definition", nowait = false, remap = false },
    {
        "<leader>lgi",
        "<cmd>lua vim.lsp.buf.implementation()<CR>",
        desc = "Implementation",
        nowait = false,
        remap = false,
    },
    { "<leader>lh", "<cmd>Lspsaga hover_doc<CR>", desc = "Hover text", nowait = false, remap = false },
    { "<leader>lo", "<cmd>Lspsaga outline<cr>", desc = "Outline", nowait = false, remap = false },
    {
        "<leader>lq",
        "<cmd>lua require('telescope.builtin').quickfix()<cr>",
        desc = "Quickfix",
        nowait = false,
        remap = false,
    },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename", nowait = false, remap = false },
    { "<leader>lR", "<cmd>Lspsaga lsp_finder<cr>", desc = "Finder", nowait = false, remap = false },
    {
        "<leader>ls",
        "<cmd>Telescope lsp_document_symbols<cr>",
        desc = "Document Symbols",
        nowait = false,
        remap = false,
    },

    { "<leader>s", group = "Search", nowait = false, remap = false },
    {
        "<leader>sb",
        "<cmd>Telescope current_buffer_fuzzy_find<cr>",
        desc = "current buffer",
        nowait = false,
        remap = false,
    },
    { "<leader>sB", "<cmd>Telescope buffers<cr>", desc = "buffers", nowait = false, remap = false },
    { "<leader>sc", "<cmd>Telescope git_commits<cr>", desc = "commits", nowait = false, remap = false },
    { "<leader>sC", "<cmd>Telescope git_bcommits<cr>", desc = "buffer commits", nowait = false, remap = false },
    {
        "<leader>sd",
        "<cmd>Telescope lsp_workspace_diagnostics<cr>",
        desc = "workspace diagnostics",
        nowait = false,
        remap = false,
    },
    { "<leader>sh", "<cmd>Telescope command_history", desc = "command history", nowait = false, remap = false },
    { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "marks", nowait = false, remap = false },
    { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "man pages", nowait = false, remap = false },
    { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "open recent file", nowait = false, remap = false },
    { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "registers", nowait = false, remap = false },

    { "<leader>t", group = "Toggle", nowait = false, remap = false },
    { "<leader>tm", "<cmd>MarkdownPreviewToggle<CR>", desc = "markdown preview", nowait = false, remap = false },
    { "<leader>tn", "<cmd>set nonumber!<CR>", desc = "line-numbers", nowait = false, remap = false },
    { "<leader>tr", "<cmd>set norelativenumber!<CR>", desc = "relative line nums", nowait = false, remap = false },
    { "<leader>ts", '<cmd>let @/ = ""<CR>', desc = "remove search highlight", nowait = false, remap = false },
    { "<leader>tt", "<cmd>ToggleTerm direction=horizontal<CR>", desc = "terminal", nowait = false, remap = false },
    { "<leader>tT", "<cmd>ToggleTerm direction=vertical<CR>", desc = "terminal", nowait = false, remap = false },
    { "<leader>tw", "<cmd>set nowrap!<CR>", desc = "wrap text", nowait = false, remap = false },
    { "<leader>tz", "<cmd>ZenMode<CR>", desc = "zen mode", nowait = false, remap = false },

    { "<leader>T", "<cmd>Telescope live_grep<CR>", desc = "Search text", nowait = false, remap = false },
    { "<leader>v", "<cmd>vsplit<CR>", desc = "Veritcal split", nowait = false, remap = false },
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
wk.add(mappings, wk_opts)
