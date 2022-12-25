local env = require("this_computer")

local options = {
    -- General look and feel
    clipboard = { "unnamed", "unnamedplus" },
    cmdheight = 2,
    encoding = "utf-8",
    fileencoding = "utf-8",
    lazyredraw = true,
    scrolloff = 3,
    mouse = "a",
    backup = false,
    writebackup = false,
    swapfile = false,
    showcmd = true,
    showmode = false,
    updatetime = 100,
    timeoutlen = 100,
    wildmenu = true,
    signcolumn = "yes",
    fillchars = "vert:│",
    hidden = true,
    wrap = false,
    number = true,
    splitbelow = true,
    splitright = true,
    viewoptions = "cursor,folds",
    termguicolors = true,

    -- Tabs
    shiftwidth = 4,
    softtabstop = 4,
    tabstop = 4,
    expandtab = true,
    -- smartindent = true, -- not sure about this and treesitter

    -- Searching
    ignorecase = true,
    smartcase = true,
    wildmode = "list:longest",

    -- Folds
    foldenable = true,
    foldlevelstart = 100,
    foldnestmax = 5,
    foldmethod = "expr",
    foldexpr = "nvim_treesitter#foldexpr()",

    -- Global statusline
    laststatus = 3,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- Other global settings
vim.g.python3_host_prog = env.python_env_path .. "/neovim/bin/python"
vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")
