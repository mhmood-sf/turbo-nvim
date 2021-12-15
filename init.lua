--- init.lua

local fn  = vim.fn
local cmd = vim.cmd
local map = vim.api.nvim_set_keymap

--- Editor options
------------------
vim.o.sm    = true    -- showmatch: show matching brackets.
vim.o.ic    = true    -- ignorecase: case-insensitive matching.
vim.o.hls   = true    -- hlsesarch: highlight search results.
vim.o.list  = true    -- list: show trailing whitespace.
vim.o.et    = true    -- expandtab: convert tabs to whitespace.
vim.o.ai    = true    -- autoindent: indent new lines the same as previous.
vim.o.nu    = true    -- number: show line numbers.
vim.o.ru    = true    -- ruler: show cursor position in default statusline
vim.o.tgc   = true    -- termguicolors: use gui colors in terminal.
vim.o.cul   = true    -- cursorline: highlight current line.
vim.o.udf   = true    -- undofile: save undo tree for persistent undo's.
vim.o.title = false   -- title: don't set terminal title.
vim.o.wrap  = false   -- wrap: dont wrap lines.
vim.o.ls    = 2       -- laststatus: always show statusline.
vim.o.sts   = 4       -- softtabstop: 4 spaces as one tab.
vim.o.ts    = 4       -- tabstop: number of cols in one tab char.
vim.o.sw    = 4       -- shiftwidth: autoindent width.
vim.o.cc    = "80"    -- colorcolumn: highlight col to help align text.
vim.o.spl   = "en_gb" -- spelllang: set spelling language.
vim.o.ff    = "unix"  -- fileformat: unix file endings.

-- wildmode: bash-like tab completion.
vim.o.wim = "longest,list"
-- complete: enable dictionary words in completion.
vim.opt.cpt:append { "k" }
-- undodir: directory for the undofile
vim.o.udir = fn.stdpath("config") .. "/undo/"
-- detect filetypes and load filetype plugins and indent files
fn.execute "filetype plugin indent on"
-- allow syntax highlighting
fn.execute "syntax on"


--- Mappings
------------

-- Use space/backspace to repeat f/F/t/T motions
map("n", "<Space>", ";", { noremap = true })
map("n", "<BS>", ",", { noremap = true })
-- Enter to insert new line without leaving normal mode
map("n", "<Enter>", "o<Esc>", { noremap = true })
-- Avoid pressing shift all the time for ex commands
map("n", ";", ":", { noremap = true })
-- Use Esc to exit terminal-insert mode
map("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
-- Arrow keys for window sizes
map("n", "<Up>", "<C-W>+", { noremap = true })
map("n", "<Down>", "<C-W>-", { noremap = true })
map("n", "<Right>", "<C-W>>", { noremap = true })
map("n", "<Left>", "<C-W><", { noremap = true })


--- Autocmds
------------

-- Highlight ejs files as HTML.
cmd "autocmd BufNewFile,BufRead *.ejs set filetype=html"


--- Mini-Plugins
----------------

-- Auto-pairs
require "utils/pair"
Pair.create("()")
Pair.create("{}")
Pair.create("[]")
Pair.create("\"\"")
-- Zen Mode
require "utils/zen"
-- Misc.
require "utils/misc"

--- Plugins
-----------
require "jet"

-- Own plugins
Jet.pack "quintik" {
    { name = "jet",
      uri  = "git@github.com:quintik/jet-nvim" },
    { uri = "git@github.com:quintik/onedark-minimal",
      cfg = function() vim.cmd("colorscheme onedark-minimal") end },
    { uri = "git@github.com:quintik/Snip",
      opt = true,
      -- Allows Snip to parse larger files.
      cfg = function() vim.o.maxfuncdepth = 200 end }
}

-- Nvim stuff
Jet.pack "nvim" {
    { name = "treesitter",
      uri  = "git@github.com:nvim-treesitter/nvim-treesitter",
      cfg  = function() require "config/treesitter" end },
    { name = "lspconfig",
      uri  = "git@github.com:neovim/nvim-lspconfig",
      opt  = true,
      on   = { "CmdUndefined" },
      pat  = { "LspStart" },
      cfg  = function() require "config/lsp" end }
}

-- Misc. plugins
Jet.pack "misc" { "git@github.com:ervandew/supertab" }

--- Custom statusline
---------------------

-- Needs to be loaded AFTER colorscheme.
vim.o.statusline = " %n │ %f │ %m %r %h %= %y │ %l:%c "
cmd "highlight StatusLine   guifg=#88C0D0 guibg=#202020"
cmd "highlight StatusLineNC guifg=#4C566A guibg=#202020"
cmd "highlight TabLineFill  guifg=#4C566A guibg=#202020"
cmd "highlight TabLine      guifg=#4C566A guibg=#202020"
cmd "highlight TabLineSel   guifg=#88C0D0"

