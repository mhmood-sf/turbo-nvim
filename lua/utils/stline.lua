--- Custom statusline

-- Note that it must be loaded AFTER colorscheme,
-- otherwise colorscheme highlights may overwrite
-- statusline colors.
vim.o.statusline = "█ %f │ %m %r %h %= %y │ %P │ %l:%c "
vim.cmd "highlight StatusLine   guifg=#88C0D0 guibg=#202020"
vim.cmd "highlight StatusLineNC guifg=#4C566A guibg=#202020"
vim.cmd "highlight TabLineFill  guifg=#4C566A guibg=#202020"
vim.cmd "highlight TabLine      guifg=#4C566A guibg=#202020"
vim.cmd "highlight TabLineSel   guifg=#88C0D0"

