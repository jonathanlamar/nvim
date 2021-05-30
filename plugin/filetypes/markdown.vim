augroup markdown
  autocmd!
  autocmd FileType markdown set tabstop=2
  autocmd FileType markdown set softtabstop=2
  autocmd FileType markdown set shiftwidth=2
  autocmd FileType markdown set softtabstop=2
  autocmd BufWritePre *.md %s/\s\+$//e
  autocmd FileType markdown set textwidth=80
  autocmd FileType markdown set colorcolumn=80
augroup end

