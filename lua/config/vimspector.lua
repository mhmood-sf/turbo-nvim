local map  = vim.api.nvim_set_keymap
local opts = { noremap = true }

map("n", "<Leader>vb", "<Plug>VimspectorToggleBreakpoint", opts)
map("n", "<Leader>vc", "<Plug>VimspectorContinue", opts)
map("n", "<Leader>vl", "<Plug>VimspectorLaunch", opts)
map("n", "<Leader>vn", "<Plug>VimspectorJumpToNextBreakpoint", opts)
map("n", "<Leader>vp", "<Plug>VimspectorJumpToPreviousBreakpoint", opts)

vim.cmd [[
command! Spector VimspectorReset
]]
