" Custom statusline for Netrw windows
"setlocal statusline=%#StatusLineNC#%=%#StatusLineInv#\ Netrw\ %#StatusLineNC#%=
"setlocal winbar=%#StatusLineNC#%=%#StatusLineInv#\ Netrw\ %#StatusLineNC#%=
setlocal colorcolumn=""      " disable color column

" Use p to open file in the last window (instead of opening a new window).
nnoremap p P

" New File
nnoremap <buffer> nf <Plug>NetrwOpenFile

" The function for creating a dir is script-local so I have
" no choice but to remap.
nmap <buffer> nd d

" Backspace / h to go up a directory, l to go in (or open the file).
nnoremap <buffer> <BS> <Plug>NetrwBrowseUpDir
nnoremap <buffer> h <Plug>NetrwBrowseUpDir
nnoremap <buffer> l <Plug>NetrwLocalBrowseCheck
