augroup java
  autocmd!
  autocmd FileType java set tabstop=2
  autocmd FileType java set softtabstop=2
  autocmd FileType java set shiftwidth=2
  autocmd FileType java set foldmethod=indent
  autocmd FileType java set colorcolumn=100
  autocmd BufWritePre *.java %s/\s\+$//e
augroup end
