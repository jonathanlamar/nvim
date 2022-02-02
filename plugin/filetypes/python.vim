augroup python
  autocmd!
  autocmd FileType python set shiftwidth=4
  autocmd FileType python set softtabstop=4
  autocmd FileType python set tabstop=4
  autocmd FileType python set expandtab
  autocmd FileType python set autoindent
  autocmd FileType python set colorcolumn=100
  autocmd FileType python set textwidth=100
  autocmd FileType python set formatoptions-=t
  autocmd BufRead,BufNewFile  *.ipynb set syntax=python " TODO Set filetype=python for these files
  autocmd Filetype python set foldmethod=indent
  autocmd BufWritePre *.py %s/\s\+$//e " Remove all trailing whitespace
augroup end

