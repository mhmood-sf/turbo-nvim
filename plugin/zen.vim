" === Zen =====================================================================

" === Options
" 0 to disable opening netrw when exiting zen
let g:zen_netrw = exists('g:zen_netrw') ? g:zen_netrw : 1

" === Editor commands
command! Zen call s:zen()  " Toggle zen mode

" =============================================================================

let s:zen_toggle = 1

" toggles zen mode
function s:zen() abort
    if s:zen_toggle
        " disable status and tab lines
        set laststatus=0
        set showtabline=0

        " close all other windows
        execute "silent only"

        let s:zen_toggle = 0
    else
        " enable status and tab lines
        set laststatus=2
        set showtabline=2

        " open netrw if option is enabled
        if g:zen_netrw
            " silence output so cmdheight doesnt overflow
            execute "silent Vexplore"
            " go back to previous window after opening netrw
            execute "silent wincmd p"
        endif

        let s:zen_toggle = 1
    endif

    echo 'Zen Mode ' . (s:zen_toggle ? 'Off' : 'On')
endfunction

