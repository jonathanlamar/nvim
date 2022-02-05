function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd [[
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
  autocmd FileType java set foldmethod=indent
  autocmd FileType java set colorcolumn=100
  autocmd BufWritePre *.java %s/\s\+$//e
augroup end

augroup javascript
  autocmd!
  autocmd BufRead,BufNewFile  *.ts set filetype=javascript
  autocmd BufRead,BufNewFile  *.jsx set filetype=javascript
  autocmd FileType javascript set colorcolumn=100
  autocmd Filetype javascript set foldmethod=indent
  autocmd BufWritePre *.js,*.ts %s/\s\+$//e " Remove all trailing whitespace
augroup end

augroup lua
  autocmd!
  autocmd Filetype lua set foldmethod=indent
  autocmd BufWritePre *.lua %s/\s\+$//e " Remove all trailing whitespace
augroup end

augroup markdown
  autocmd!
  autocmd BufWritePre *.md %s/\s\+$//e
  autocmd FileType markdown set textwidth=100
  autocmd FileType markdown set colorcolumn=100
  autocmd FileType markdown set foldmethod=indent
augroup end

augroup python
  autocmd!
  autocmd FileType python set colorcolumn=100
  autocmd FileType python set textwidth=100
  autocmd BufRead,BufNewFile  *.ipynb set syntax=python " TODO Set filetype=python for these files
  autocmd Filetype python set foldmethod=indent
  autocmd BufWritePre *.py %s/\s\+$//e " Remove all trailing whitespace
augroup end

augroup scala
  autocmd!
  autocmd BufRead,BufNewFile *.sbt set filetype=scala
  autocmd FileType scala set foldmethod=syntax " This will do for now
  autocmd FileType scala set colorcolumn=100
  autocmd BufWritePre *.scala,*.sbt %s/\s\+$//e
augroup end

augroup sql
  autocmd!
  autocmd FileType sql set foldmethod=indent
  autocmd BufWritePre *.sql %s/\s\+$//e
augroup end


augroup vim
  autocmd!
  autocmd FileType vim set foldmethod=indent
  autocmd BufWritePre *.vim %s/\s\+$//e " Remove all trailing whitespace
augroup end

augroup yaml
  autocmd!
  autocmd Filetype yaml set foldmethod=indent
augroup end
]]
