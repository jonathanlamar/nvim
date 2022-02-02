augroup markdown
  autocmd!
  autocmd FileType markdown set tabstop=4
  autocmd FileType markdown set softtabstop=4
  autocmd FileType markdown set shiftwidth=4
  autocmd FileType markdown set softtabstop=4
  autocmd BufWritePre *.md %s/\s\+$//e
  autocmd FileType markdown set textwidth=100
  autocmd FileType markdown set colorcolumn=100
  autocmd FileType markdown set foldmethod=indent
augroup end

