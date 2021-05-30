augroup javascript
  autocmd!
  autocmd BufRead,BufNewFile  *.ts set filetype=javascript
  autocmd BufRead,BufNewFile  *.jsx set filetype=javascript
  autocmd FileType javascript set shiftwidth=2
  autocmd FileType javascript set softtabstop=2
  autocmd FileType javascript set tabstop=2
  autocmd FileType javascript set expandtab
  autocmd FileType javascript set autoindent
  autocmd FileType javascript set colorcolumn=80
  autocmd filetype javascript set foldmethod=indent
  autocmd BufWritePre *.js,*.ts %s/\s\+$//e " Remove all trailing whitespace
augroup end

