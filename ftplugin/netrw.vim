" Custom statusline for Netrw windows
setlocal statusline=\ %#StatusLineNC#\ %=\ %#StatusLineInv#\ Netrw\ %#StatusLineNC#\ %=
setlocal colorcolumn=""      " disable color column

nnoremap <buffer> nf <Plug>NetrwOpenFile
" the function for creating a dir is script-local so I have
" no choice but to remap
nmap <buffer> nd d
nnoremap <buffer> <BS> <Plug>NetrwBrowseUpDir
nnoremap <buffer> h <Plug>NetrwBrowseUpDir
nnoremap <buffer> l <Plug>NetrwLocalBrowseCheck
