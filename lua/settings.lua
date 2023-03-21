-- General look and feel
vim.opt.clipboard = { "unnamed", "unnamedplus" }
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.scrolloff = 3
vim.opt.mouse = "a"
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.updatetime = 100
vim.opt.timeoutlen = 100
vim.opt.wildmenu = true
vim.opt.signcolumn = "yes"
vim.opt.fillchars = "vert:│"
vim.opt.hidden = true
vim.opt.wrap = false
vim.opt.number = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.viewoptions = { "cursor", "folds" }
vim.opt.termguicolors = true
vim.opt.completeopt = { "menu", "menuone", "noinsert", "noselect" }
vim.opt.pumheight = 20
vim.opt.laststatus = 3 -- Global statusline
vim.opt.fillchars:append({
    horiz = "━",
    horizup = "┻",
    horizdown = "┳",
    vert = "┃",
    vertleft = "┨",
    vertright = "┣",
    verthoriz = "╋",
})
vim.opt.showmode = false
vim.opt.guicursor = { -- blinking cursor
    "n-v-c:block",
    "i-ci-ve:ver25",
    "r-cr:hor20",
    "o:hor50",
    "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
    "sm:block-blinkwait175-blinkoff150-blinkon175",
}

-- Tabs and Indenting
-- These should be covered by tpope/vim-sleuth
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
-- Special rules for python
vim.g.python_indent = {
    disable_parentheses_indenting = false,
    closed_paren_align_last_line = false,
    searchpair_timeout = 150,
    continue = "shiftwidth()",
    open_paren = "shiftwidth()",
    nested_paren = "shiftwidth()",
}

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wildmode = "list:longest"

-- Folds
vim.opt.foldenable = true
vim.opt.foldlevelstart = 100
vim.opt.foldnestmax = 5
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Spelling suggestions only enabled in markdown and text filetypes
vim.opt.spell = false
vim.opt.spelllang = { "en_us" }

-- Other global settings
local env = require("this_computer")
vim.g.python3_host_prog = env.python_env_path .. "/bin/python"
vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")

-- Required by nvim-tree to take over the netrw functionality
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
