local fn  = vim.fn
local cmd = vim.cmd
local map = vim.api.nvim_set_keymap

--[ Editor options ]--
vim.o.sm    = true    -- showmatch: show matching brackets.
vim.o.sc    = true    -- showcmd: show command as it is being typed
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
vim.o.tw    = 80      -- textwidth: max width, longer lines are broken up.
vim.o.spl   = "en_gb" -- spelllang: set spelling language.
vim.o.ff    = "unix"  -- fileformat: unix file endings.

-- wildmode: bash-like tab completion.
vim.o.wim = "longest,list"
-- complete: enable dictionary words in completion.
vim.opt.cpt:append { "k" }
-- undodir: directory for the undofile
vim.o.udir = fn.stdpath("data") .. "/undo/"
-- detect filetypes and load filetype plugins and indent files
fn.execute "filetype plugin indent on"
-- allow syntax highlighting
fn.execute "syntax on"

--[ Mappings ]--

-- Use space as leader.
vim.g.mapleader = " "

local opts = { noremap = true }

-- Enter to insert new line without leaving normal mode
map("n", "<Enter>", "o<Esc>", opts)

-- Avoid pressing shift all the time for ex commands
map("n", ";", ":", opts)

-- Use F1 to exit terminal-insert mode
map("t", "<F1>", "<C-\\><C-n>", opts)

-- Arrow keys for window sizes
map("n", "<Up>",    "<C-W>+", opts)
map("n", "<Down>",  "<C-W>-", opts)
map("n", "<Right>", "<C-W>>", opts)
map("n", "<Left>",  "<C-W><", opts)

-- H: First non-blank char of line.
-- L: Last character of line.
map("n", "<S-h>", "^zz",     opts)
map("n", "<S-l>", "$zz",    opts)

-- J: Scroll downwards based on 'scroll' option
-- K: Scroll upwards based on 'scroll' option
map("n", "<S-j>", "<C-d>M", opts)
map("n", "<S-k>", "<C-u>M", opts)

-- <C-hjkl> for splits!
map("n", "<C-h>", ":vsplit<CR>", opts)
map("n", "<C-k>", ":split<CR>", opts)
map("n", "<C-l>", ":vsplit<CR><C-w>l", opts)
map("n", "<C-j>", ":split<CR><C-w>j", opts)

-- <Esc> to clear search highlighting
map("n", "<Esc>", "<Cmd>nohlsearch|diffupdate<CR><C-L>", opts)


--[ Autocmds ]--

-- Highlight ejs files as HTML.
cmd "autocmd BufNewFile,BufRead *.ejs set filetype=html"
-- Highlight sty/cls files as TeX.
cmd "autocmd BufNewFile,BufRead *.sty set filetype=tex"
cmd "autocmd BufNewFile,BufRead *.cls set filetype=tex"

--[ Plugins ]--
require "jet-config"

--[ Mini-Plugins ]--
require("utils.pair").create { "()", "{}", "[]", "\"\"" }
require "utils.stline"
require "utils.misc"
require "utils.zen"

