augroup sql
  autocmd!
  autocmd FileType sql set tabstop=2
  autocmd FileType sql set softtabstop=2
  autocmd FileType sql set shiftwidth=2
  autocmd FileType sql set softtabstop=2
  autocmd BufWritePre *.sql %s/\s\+$//e
augroup end


