let NERDTreeDirArrows = 1

augroup nerd
  " nnoremap <space>n :NERDTreeFocus <CR>
  " autocmd FileType nerdtree nnoremap <buffer> <Esc> :NERDTreeClose <CR>
  " autocmd FileType nerdtree nnoremap <buffer> <space>n :NERDTreeClose <CR>

  " Close nerd tree if it is the only open buffer
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  autocmd FileType nerdtree set scl=no
augroup end

" let NERDTreeMapActivateNode = 'o'
let NERDTreeMapOpenSplit = 'h'
let NERDTreeMapPreviewSplit = 'gs'
let NERDTreeMapOpenVSplit = 'v'
let NERDTreeMapPreviewVSplit = 'gv'
let NERDTreeMapToggleHidden = '.'
