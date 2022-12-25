function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

local utils = require("nvim-tree.utils")
vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if #vim.api.nvim_list_wins() == 1 and utils.is_nvim_tree_buf() then
            vim.cmd("quit")
        end
    end,
})

-- Don't autocomment new lines
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*", command = "set fo-=c fo-=r fo-=o" })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})

-- TODO: Convert these to lua
vim.cmd([[
"" Move cursorline to active window
autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
autocmd! TermOpen term://* lua set_terminal_keymaps()

augroup bash
    autocmd!
    autocmd BufWritePre *.sh %s/\s\+$//e
augroup end

augroup java
    autocmd!
    autocmd FileType java set colorcolumn=100
    autocmd BufWritePre *.java %s/\s\+$//e
augroup end

augroup javascript
    autocmd!
    autocmd BufRead,BufNewFile  *.ts set filetype=typescript
    autocmd BufRead,BufNewFile  *.jsx set filetype=javascript
    autocmd FileType javascript set colorcolumn=100
    autocmd BufWritePre *.js,*.ts %s/\s\+$//e
augroup end

augroup lua
    autocmd!
    autocmd BufWritePre *.lua %s/\s\+$//e
augroup end

augroup markdown
    autocmd!
    autocmd BufWritePre *.md %s/\s\+$//e
    autocmd FileType markdown set textwidth=100
    autocmd FileType markdown set colorcolumn=100
augroup end

augroup python
    autocmd!
    autocmd FileType python set colorcolumn=100
    autocmd BufRead,BufNewFile  *.ipynb set syntax=python
    autocmd BufWritePre *.py %s/\s\+$//e
    autocmd FileType python set foldmethod=indent
    autocmd FileType python set foldexpr=''
augroup end

augroup scala
    autocmd!
    autocmd BufRead,BufNewFile *.sbt set filetype=scala
    autocmd FileType scala set colorcolumn=100
    autocmd BufWritePre *.scala,*.sbt %s/\s\+$//e
augroup end

augroup sql
    autocmd!
    autocmd BufWritePre *.sql %s/\s\+$//e
augroup end

augroup vim
    autocmd!
    autocmd BufWritePre *.vim %s/\s\+$//e
augroup end
]])
