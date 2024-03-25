vim.g.modenames = {
    n = "normal",
    no = "op pending",
    nov = "op pending",
    noV = "op pending",
    v = "visual",
    vs = "visual",
    V = "visual",
    Vs = "visual",
    s = "select",
    S = "select",
    i = "insert",
    ic = "insert",
    ix = "insert",
    R = "replace",
    Rc = "replace",
    Rx = "replace",
    Rv = "replace",
    Rvc = "replace",
    Rvx = "replace",
    r = "prompt",
    rm = "prompt",
    c = "cmd",
    cv = "ex mode",
    ["!"] = "shell",
    t = "terminal",
}

-- Note that it must be loaded AFTER colorscheme,
-- otherwise colorscheme highlights may overwrite
-- statusline colors.
vim.o.statusline = "%#StatusLineInv#%{toupper(get(g:modenames, mode(), mode(1)))} %#StatusLine# %<%{getcwd()} %= %S %= %Y ┃ %P ┃ %l:%c %q%r%h%#StatusLine#█"
vim.o.winbar = "%= %{%g:actual_curwin == win_getid() ? '%#StatusLineInv#' : '%#StatusLineInactiveSlant#%#StatusLine#' %}%{getbufvar(bufnr(), '&mod') ? ' ●' : ''} %f %{%g:actual_curwin == win_getid() ? '%#StatusLineInv#' : '%#StatusLineInactiveSlant#%#StatusLine#' %}%#StatusLineNC# %="

-- We want laststatus = 3 for this statusline.
vim.o.ls = 3

local hi = require(vim.g.colors_name).hi
local color = require(vim.g.colors_name).colors

hi("StatusLine",    { fg = color.accent5, bg = color.shade1 })
hi("StatusLineInv", { fg = color.shade0,  bg = color.accent5 })
hi("TabLine",       { fg = color.shade3,  bg = color.shade0 })
hi("TabLineSel",    { fg = color.accent5, bg = color.shade0 })
hi("TabLineFill",   { fg = color.shade3,  bg = color.shade0 })

hi("StatusLineInactiveSlant", { fg = color.shade1, bg = color.shade0 })
