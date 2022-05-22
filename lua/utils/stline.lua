--- Custom statusline

--[[
local catppuccin = {
     FLAMINGO  = "#F2CDCD",  MAUVE     = "#DDB6F2",
     PINK      = "#F5C2E7",  MAROON    = "#E8A2AF",
     RED       = "#F28FAD",  PEACH     = "#F8BD96",
     YELLOW    = "#FAE3B0",  GREEN     = "#ABE9B3",
     TEAL      = "#B5E8E0",  BLUE      = "#96CDFB",
     SKY       = "#89DCEB",  ROSEWATER = "#F5E0DC",
     LAVENDAR  = "#C9CBFF",  WHITE     = "#D9E0EE",
     GRAY2     = "#C3BAC6",  GRAY1     = "#988BA2",
     GRAY0     = "#6E6C7E",  BLACK4    = "#575268",
     BLACK3    = "#302D41",  BLACK2    = "#1E1E2E",
     BLACK1    = "#1A1826",  BLACK0    = "#161320"
}
--]]

-- Note that it must be loaded AFTER colorscheme,
-- otherwise colorscheme highlights may overwrite
-- statusline colors.
vim.o.statusline = "%{getbufvar(bufnr(), '&mod') ? '  ●' : ''} %f %#StatusLineNC#%{g:actual_curbuf == bufnr() ? '' : ''} %= %Y  %P  %l:%c %q%r%h"
vim.cmd "highlight StatusLine   guifg=#161320 guibg=#BD93F9"
vim.cmd "highlight StatusLineNC guifg=#BD93F9 guibg=#1E1E2E"

vim.cmd "highlight TabLine      guifg=#BD93F9 guibg=#1E1E2E"
vim.cmd "highlight TabLineSel   guifg=#1E1E2E guibg=#BD93F9"
vim.cmd "highlight TabLineFill  guifg=#BD93F9 guibg=#1E1E2E"

--[[
default_value = {
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
