local utils = require('utils')
local cmd = vim.cmd
utils.opt('o', 'termguicolors', true)

-- Set contrast.
-- This configuration option should be placed before `colorscheme gruvbox-material`.
-- Available values: 'hard', 'medium'(default), 'soft'
-- cmd 'let g:gruvbox_material_background = \'soft\''
-- Can also do this
cmd 'let g:gruvbox_material_transparent_background = 1'

-- This should go at the bottom
cmd 'colorscheme gruvbox-material'
