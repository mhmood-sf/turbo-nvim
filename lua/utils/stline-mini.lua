-- Basic decorations
vim.o.statusline = "%{getbufvar(bufnr(), '&mod') ? ' ● ' : ''}%f  %= %Y  %P  %l:%c %q%r%h"

-- Clear all the distracting highlighting.
vim.cmd "highlight clear StatusLine"

