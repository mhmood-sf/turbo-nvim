" === Pairs ========================================================

function! CompletePair(b)
    " get cursor position
    let pos = getpos('.')
    let line_nr = pos[1]
    let col_nr = pos[2]

    echom "line nr: " . line_nr
    echom "col nr: " . col_nr

    " get current line
    let line = getline(line_nr)
    echom "line: " . line
    echom "len: " . len(line)

    if col_nr > len(line)
        return a:b
    endif

    " convert arg to char code
    let code = char2nr(a:b)
    " convert line to list of char codes
    let codes = str2list(line)
    " use column number to get code for next character
    let next = codes[col_nr - 1]

    " if it's the same character, don't insert it.
    return code == next ? "\<Right>" : a:b
endfunction

function! s:pair(ab)
    let a = a:ab[0]
    let b = a:ab[1]

    execute("inoremap " . a . " " . a . b . "<Left>")
    if a != b
        execute("inoremap " . b . " <C-R>=CompletePair('" . b . "')<CR>")
    endif
endfunction

call s:pair('()')
call s:pair('{}')
call s:pair('""')
call s:pair('<>')
call s:pair('[]')

