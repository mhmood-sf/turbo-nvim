setlocal nospell   " Do not highlight spelling errors
setlocal wrap      " Wrap long lines
setlocal linebreak " Wrap lines at sane points

" Don't break up lines in tasks files.
if expand("%:t") == "tasks.txt"
    setlocal tw=0
endif
