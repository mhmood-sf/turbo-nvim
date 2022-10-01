-- Hide statusline by setting laststatus and cmdheight to 0.
vim.o.ls = 0
vim.o.ch = 0

-- Set the winbar to the statusline.
vim.o.wbr = "%#StatusLineNC#%=%#StatusLineInv# %f %#StatusLineNC#%="
--vim.o.wbr = vim.o.stl

-- With vertical splits, the statusline would still show up at the
-- bottom of the split. A quick fix is to just set the statusline
-- to empty whitespace (it can't be an empty string because then
-- it'll get replaced by the default stline).
vim.o.stl = " "

-- Highlight groups.
vim.cmd "highlight StatusLine    guifg=#FC56B1 guibg=#17171C"
vim.cmd "highlight StatusLineInv guifg=#17171C guibg=#FC56B1"
vim.cmd "highlight StatusLineNC  guifg=#FC56B1 guibg=#17171C"

vim.cmd "highlight TabLine      guifg=#FC56B1 guibg=#222430"
vim.cmd "highlight TabLineSel   guifg=#222430 guibg=#FC56B1"
vim.cmd "highlight TabLineFill  guifg=#FC56B1 guibg=#222430"
