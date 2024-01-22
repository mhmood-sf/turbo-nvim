--- Custom statusline

vim.g.modenames = {
    n = "normal",
    v = "visual",
    t = "terminal",
    s = "select",
    i = "insert",
    ["!"] = "shell",
    r = "prompt",
    c = "cmd"
}

-- Note that it must be loaded AFTER colorscheme,
-- otherwise colorscheme highlights may overwrite
-- statusline colors.
vim.o.statusline = "%#StatusLineInv#%{toupper(get(g:modenames, mode(), mode(1)))} %#StatusLine# %<%{getcwd()} %= %S %= %Y ┃ %P ┃ %l:%c %q%r%h%#StatusLine#█"
vim.o.winbar = "%= %{%g:actual_curwin == win_getid() ? '%#StatusLineInv#' : '%#StatusLineInactiveSlant#%#StatusLine#' %}%{getbufvar(bufnr(), '&mod') ? ' ●' : ''} %f %{%g:actual_curwin == win_getid() ? '%#StatusLineInv#' : '%#StatusLineInactiveSlant#%#StatusLine#' %}%#StatusLineNC# %="

-- We want laststatus = 3 for this statusline.
vim.o.ls = 3

local hi = (vim.g.colors_name).hi
local color = (vim.g.colors_name).colors

hi("StatusLine",    { fg = color.accent5, bg = color.shade1 })
hi("StatusLineInv", { fg = color.shade0,  bg = color.accent5 })
hi("TabLine",       { fg = color.shade3,  bg = color.shade0 })
hi("TabLineSel",    { fg = color.accent5, bg = color.shade0 })
hi("TabLineFill",   { fg = color.shade3,  bg = color.shade0 })

hi("StatusLineInactiveSlant", { fg = color.shade1, bg = color.shade0 })

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

local misc = "                                    "

--]]
