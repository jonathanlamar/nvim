local utils = require('utils')

local cmd = vim.cmd
local indent = 4

-- General look and feel
cmd 'syntax enable'
cmd 'filetype plugin indent on'
utils.opt('o', 'clipboard','unnamed,unnamedplus')
utils.opt('o', 'cmdheight', 2)
utils.opt('o', 'encoding', 'utf-8')
utils.opt('o', 'fileencoding', 'utf-8')
utils.opt('o', 'lazyredraw', true)
utils.opt('o', 'scrolloff', 3)
utils.opt('o', 'mouse', 'a')
utils.opt('o', 'backup', false)
utils.opt('o', 'writebackup', false)
utils.opt('o', 'swapfile', false)
utils.opt('o', 'showcmd', true)
utils.opt('o', 'updatetime', 100)
utils.opt('o', 'wildmenu', true)
utils.opt('o', 'signcolumn', 'yes')
utils.opt('o', 'fillchars', 'vert:│')
utils.opt('o', 'hidden', true)
utils.opt('o', 'wrap', false)
utils.opt('o', 'number', true)
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'splitright', true)
utils.opt('o', 'viewoptions', 'cursor,folds')
-- Highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

-- Tabs
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'softtabstop', indent)
utils.opt('b', 'tabstop', indent)
utils.opt('b', 'expandtab', true)

-- Searching
utils.opt('b', 'smartindent', true)
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'smartcase', true)
utils.opt('o', 'wildmode', 'list:longest')

-- Folds
utils.opt('o', 'foldenable', true)
utils.opt('o', 'foldlevelstart', 100)
utils.opt('o', 'foldnestmax', 1000)

-- Move cursorline to active window
cmd 'autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline'
cmd 'autocmd WinLeave * setlocal nocursorline'
