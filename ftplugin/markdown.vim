setlocal tw=0      " Don't automatically insert new lines for long lines
setlocal nospell   " Gets annoying
setlocal wrap      " Wrap long lines
setlocal linebreak " Wrap long lines at sane points

command! -buffer -nargs=0 MDOpen call s:open()

function! s:open() abort
    let l:kitty_config = "~/.config/kitty/kitty-light.conf"
    let l:glow_config  = "~/.config/glow/styles/light.json"
    let l:cmd = "kitty -c " . l:kitty_config . " -e glow -s " . l:glow_config . " -p " . expand("%:p")
    call jobstart(l:cmd)
endfunction
