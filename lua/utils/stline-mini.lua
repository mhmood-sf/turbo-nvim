vim.o.statusline = "%{getbufvar(bufnr(), '&mod') ? ' ● ' : ''}%f  %= %Y  %P  %l:%c %q%r%h"
vim.cmd "highlight clear StatusLine"

