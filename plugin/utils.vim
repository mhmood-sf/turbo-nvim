" === Utils ==================================================================

" === Options
let g:utils_pathsep = '/'  " separator for filepaths, either '/' or '\'

" === Editor Commands
command -nargs=0 BufClean call s:bufclean()
command -nargs=0 Rand echo s:rand()
command -nargs=0 InitVim edit $MYVIMRC

" =============================================================================

" Delete all buffers except current one
" Errors if a buffer is unsaved
function s:bufclean() abort
    let l:cnt = 0
    for buf in getbufinfo()
        " check if buffer is active or not
        if buf.bufnr == bufnr()
            continue
        " check if buffer is listed or not
        elseif buf.listed
            let l:cnt = l:cnt + 1
            " if listed, delete it
            execute 'bd' . buf.bufnr
        endif
    endfor

    echo 'Cleaned ' . l:cnt . ' buffers'
endfunction

" gives a random number from 0-9
function s:rand() abort
    let l:n = str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+'))[0]
    return l:n
endfunction

" change separator in file path to g:utils_pathsep
function utils#fixpath(str)
    if g:utils_pathsep == '\'
        return substitute(a:str, '/', g:utils_pathsep, 'g')
    else
        return substitute(a:str, '\', g:utils_pathsep, 'g')
    endif
endfunction


