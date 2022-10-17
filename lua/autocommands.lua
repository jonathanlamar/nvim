function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd([[
  "" Highlight on yank
autocmd TextYankPost * lua vim.highlight.on_yank {on_visual = false}

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
  autocmd FileType javascript set shiftwidth=2
  autocmd FileType javascript set tabstop=2
  autocmd FileType javascript set softtabstop=2
  autocmd FileType typescript set shiftwidth=2
  autocmd FileType typescript set tabstop=2
  autocmd FileType typescript set softtabstop=2
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

augroup yaml
  autocmd!
augroup end
]])
