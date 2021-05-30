local utils = require('utils')
utils.map('i',  '<Up>',    '<Nop>')
utils.map('i',  '<Down>',  '<Nop>')
utils.map('i',  '<Left>',  '<Nop>')
utils.map('i',  '<Right>', '<Nop>')

utils.map('i',  '<C-Up>',    '<Nop>')
utils.map('i',  '<C-Down>',  '<Nop>')
utils.map('i',  '<C-Left>',  '<Nop>')
utils.map('i',  '<C-Right>', '<Nop>')

utils.map('n',  '<Up>',    '<Nop>')
utils.map('n',  '<Down>',  '<Nop>')
utils.map('n',  '<Left>',  '<Nop>')
utils.map('n',  '<Right>', '<Nop>')

utils.map('n',  '<C-Up>',    '<Nop>')
utils.map('n',  '<C-Down>',  '<Nop>')
utils.map('n',  '<C-Left>',  '<Nop>')
utils.map('n',  '<C-Right>', '<Nop>')

-- Insert mode nav keys
utils.map('i',  '<C-k>', '<Up>')
utils.map('i',  '<C-j>', '<Down>')
utils.map('i',  '<C-h>', '<Left>')
utils.map('i',  '<C-l>', '<Right>')

-- When using macros, I always accidentally hit shift-Q and go to Ex mode.
utils.map('n',  'Q', '<Nop>')

-- Add blank line below cursor
utils.map('n',  '<M-o>', 'o<Esc>')

-- Window resize a la i3
utils.map('n',  '<M-j>', ':resize -1<CR>')
utils.map('n',  '<M-k>', ':resize +1<CR>')
utils.map('n',  '<M-h>', ':vertical resize -1<CR>')
utils.map('n',  '<M-l>', ':vertical resize +1<CR>')
