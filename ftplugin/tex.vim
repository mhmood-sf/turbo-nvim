" === TeX =====================================================================

" === Editor commands
command -nargs=0 Build call s:build()
command -nargs=0 Open call s:open()
command -nargs=0 Logs call s:logs()
command -nargs=0 MathSyn call s:mathsyn()

" === Common settings
set dictionary+=~/AppData/Local/nvim/dicts/latex.txt
let g:tex_flavor = 'latex' " plain | context | latex

" === Options for build command
let s:synctex     = '0'           " Use synctex (1/-1) or not (0)
let s:interaction = 'nonstopmode' " Interaction mode
let s:viewer      = 'SumatraPDF-3.2-64.exe'

" =============================================================================

let s:cmdoutput = []

function s:open() abort
    " Get the outpath for the file and change extension to pdf
    let l:file = utils#fixpath(expand('%:s?src?out?:rp') . '.pdf')
    let l:cmd  = s:viewer . ' ' . l:file

    echo l:cmd
    call jobstart(l:cmd, {'detach': 1})
endfunction

function s:logs() abort
    if len(s:cmdoutput)
        for line in s:cmdoutput
            echo line
        endfor
    else
        echo "No logs available yet. Run :Build first."
    endif
endfunction

function s:build() abort
    " source file absolute path "(and remove extension)
    let l:file = utils#fixpath(expand('%:p'))
    " replace src/ with aux/ (and remove filename from path)
    let l:auxpath = utils#fixpath(expand('%:s?src?bin?:hp'))
    " replace src/ with out/ (and remove filename)
    let l:outpath = utils#fixpath(expand('%:s?src?out?:hp'))
    " obtain absolute path to source file (without filename)
    let l:incpath = utils#fixpath(expand('%:hp'))

    let l:exe = 'pdflatex'
    let l:syn = ' --synctex=' . s:synctex
    let l:int = ' --interaction=' . s:interaction
    let l:aux = ' --aux-directory=' . l:auxpath
    let l:out = ' --output-directory=' . l:outpath
    let l:inc = ' --include-directory=' . l:incpath

    let l:cmd = l:exe . l:syn . l:int . l:aux . l:out . l:inc . ' ' . l:file
    echo "Compiling..."
    let l:output = split(system(l:cmd), "\n")

    let s:cmdoutput = copy(l:output) " Store output to show in command

    call s:printFormatted(l:output)
endfunction

function s:printFormatted(output) abort
    " clear previous output
    redraw
    if len(a:output) <= 0
        return 'No output'
    endif

    " only keep important lines
    call filter(a:output,
        \ {idx, val ->
        \ match(val, "!") == 0 ||
        \ match(val, "l\\.") == 0 })

    if len(a:output) <= 0
        echo "No errors! Use :Open to open the pdf, :Logs to view the build output."
        return
    endif

    echom 'Errors/Warnings:'
    for line in a:output
        echom line
    endfor

    echo 'Use :Logs to view the full output'
endfunction

" fix highlighting in align zone
function s:mathsyn()
    call TexNewMathZone('M', 'align', 1)
endfunction

