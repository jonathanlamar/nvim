augroup python
  autocmd!
  autocmd FileType python set shiftwidth=4
  autocmd FileType python set softtabstop=4
  autocmd FileType python set tabstop=4
  autocmd FileType python set expandtab
  autocmd FileType python set autoindent
  autocmd FileType python set colorcolumn=88
  autocmd BufRead,BufNewFile  *.ipynb set syntax=python " TODO Set filetype=python for these files
  autocmd filetype python set foldmethod=indent
  autocmd BufWritePre *.py %s/\s\+$//e " Remove all trailing whitespace
  " FIXME - This runs asynchronously, so the edit ends up happening after the
  " save sometimes.
  " autocmd BufWritePre *.py :PyrightOrganizeImports " sort imports
augroup end

