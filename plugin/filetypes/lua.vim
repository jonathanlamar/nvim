augroup lua
  autocmd!
  autocmd FileType lua set tabstop=2
  autocmd FileType lua set softtabstop=2
  autocmd FileType lua set shiftwidth=2
  autocmd FileType lua set softtabstop=2
  autocmd BufWritePre *.lua %s/\s\+$//e " Remove all trailing whitespace
augroup end

