--- Custom statusline

-- Note that it must be loaded AFTER colorscheme,
-- otherwise colorscheme highlights may overwrite
-- statusline colors.
vim.o.statusline = "%{%g:actual_curwin == win_getid() ? '%#StatusLineInv#' : '%#StatusLine#' %} %{getbufvar(bufnr(), '&mod') ? '●' : ''} %f %#StatusLineNC#%{g:actual_curwin == win_getid() ? '' : ''} %= %Y  %P  %l:%c %q%r%h"
vim.cmd "highlight StatusLine    guifg=#FC56B1 guibg=#17171C"
vim.cmd "highlight StatusLineInv guifg=#17171C guibg=#FC56B1"
vim.cmd "highlight StatusLineNC  guifg=#FC56B1 guibg=#17171C"

vim.cmd "highlight TabLine      guifg=#FC56B1 guibg=#222430"
vim.cmd "highlight TabLineSel   guifg=#222430 guibg=#FC56B1"
vim.cmd "highlight TabLineFill  guifg=#FC56B1 guibg=#222430"

--[[
local symbol = {
    vertical_bar = '┃',
    vertical_bar_thin = '│',
    left = '',
    right = '',
    block = '█',
    left_filled = '',
    right_filled = '',
    slant_left = '',
    slant_left_thin = '',
    slant_right = '',
    slant_right_thin = '',
    slant_left_2 = '',
    slant_left_2_thin = '',
    slant_right_2 = '',
    slant_right_2_thin = '',
    left_rounded = '',
    left_rounded_thin = '',
    right_rounded = '',
    right_rounded_thin = '',
    circle = '●',
}
--]]
