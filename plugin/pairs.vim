" === Pairs ========================================================

let s:pairs = {}

" When the right part of a pair is typed,
" check to see if it is already there,
" and skip it if so.
function! CompletePair(b)
    " get cursor position
    let pos = getpos('.')
    let line_nr = pos[1]
    let col_nr = pos[2]

    " get current line
    let line = getline(line_nr)

    " no next character, i.e cursor is at
    " the end of the line, so return early.
    if col_nr > len(line)
        return a:b
    endif

    " convert arg to char code
    let code = char2nr(a:b)
    " convert line to list of char codes,
    " to handle utf-8 chars with longer encoding
    " which only take a single column
    let codes = str2list(line)
    " use column number to get code for next character
    " - 1 cos 0-indexed array
    let next = codes[col_nr - 1]

    " if it's the same character, don't insert it.
    return code == next ? "\<Right>" : a:b
endfunction

" When pressing <BS>, check if cursor
" is in the middle of a pair, and delete
" both parts if there is nothing between
" the pair.
function! ConsumePair()
    " get cursor position
    let pos = getpos('.')
    let line_nr = pos[1]
    let col_nr = pos[2]

    " get current line
    let line = getline(line_nr)

    " cursor is at the end of the line,
    " return early
    if col_nr > len(line)
        return "\<BS>"
    endif

    " convert to char codes list
    let codes = str2list(line)

    " get left right characters
    let left_char = nr2char(codes[col_nr - 2])
    let right_char = nr2char(codes[col_nr - 1])

    " check if left right chars are a pair
    " and return the appropriate key sequence
    if get(s:pairs, left_char, "") == right_char
        return "\<Right>\<BS>\<BS>"
    else
        return "\<BS>"
    end
endfunction

function! s:pair(leftc_rightc)
    let leftc = a:leftc_rightc[0]
    let rightc = a:leftc_rightc[1]

    let s:pairs[leftc] = rightc

    execute("inoremap <silent> " . leftc . " " . leftc . rightc . "<Left>")
    if leftc != rightc
        execute("inoremap <silent> " . rightc . " <C-R>=CompletePair('" . rightc . "')<CR>")
    endif
endfunction

inoremap <silent> <BS> <C-R>=ConsumePair()<CR>

call s:pair('()')
call s:pair('{}')
call s:pair('""')
call s:pair('[]')

