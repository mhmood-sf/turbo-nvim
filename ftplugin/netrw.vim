" === NETRW ===================================================================

" === Custom statusline for Netrw windows
setlocal statusline=\ 
setlocal statusline+=%=
setlocal statusline+=Netrw
setlocal statusline+=%=
setlocal statusline+=%*

" === Netrw configuration
let g:netrw_banner = 0       " Get rid of banner 
let g:netrw_altv = 1         " right splitting
let g:netrw_browse_split = 4 " Open in previous window
let g:netrw_preview = 1      " preview in vertical split

