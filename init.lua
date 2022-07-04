local fn  = vim.fn
local cmd = vim.cmd
local map = vim.api.nvim_set_keymap

--[ Editor options ]--
vim.o.sm    = true    -- showmatch: Show matching brackets.
vim.o.sc    = true    -- showcmd: Show command as it is being typed.
vim.o.ic    = true    -- ignorecase: Case-insensitive matching.
vim.o.et    = true    -- expandtab: Convert tabs to whitespace.
vim.o.ai    = true    -- autoindent: Indent new lines the same as previous.
vim.o.nu    = true    -- number: Show line numbers.
vim.o.ru    = true    -- ruler: Show cursor position in default statusline.
vim.o.lz    = true    -- lazyredraw: Postpone redraws for various commands.
vim.o.hls   = true    -- hlsesarch: Highlight search results.
vim.o.tgc   = true    -- termguicolors: Use gui colors in terminal.
vim.o.udf   = true    -- undofile: Save undo tree for persistent undo's.
vim.o.list  = true    -- list: Show trailing whitespace.

vim.o.cul   = false   -- cursorline: Don't highlight current line.
vim.o.title = false   -- title: Don't set terminal title.
vim.o.wrap  = false   -- wrap: Dont wrap lines.

vim.o.ls    = 2       -- laststatus: Always show statusline.
vim.o.sts   = 4       -- softtabstop: 4 spaces as one tab.
vim.o.ts    = 4       -- tabstop: Number of cols in one tab char.
vim.o.sw    = 4       -- shiftwidth: Autoindent width.
vim.o.tw    = 80      -- textwidth: Max width, longer lines are broken up.
vim.o.cc    = "80"    -- colorcolumn: Highlight col to help align text.
vim.o.ff    = "unix"  -- fileformat: Unix file endings.
vim.o.spl   = "en_gb" -- spelllang: Set spelling language.

-- complete: Enable dictionary words in completion.
vim.opt.cpt:append { "k" }
-- wildmode: Bash-like tab completion.
vim.o.wim = "longest,list"
-- undodir: Directory for the undofile
vim.o.udir = fn.stdpath("data") .. "/undo/"

-- Detect filetypes and load filetype plugins and indent files
fn.execute "filetype plugin indent on"
-- Allow syntax highlighting
fn.execute "syntax on"

--[ Mappings ]--
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
cmd "autocmd BufNewFile,BufRead *.ejs set syntax=html"
cmd "autocmd BufNewFile,BufRead *.sty set syntax=tex"
cmd "autocmd BufNewFile,BufRead *.cls set syntax=tex"

--[ Editor Commands ]--
cmd "command! -nargs=0 InitLua edit $MYVIMRC"
cmd "command! -nargs=0 TODO    exe 'edit ' . stdpath('data') . '/TODO.md'"

--[ Plugins ]--
require "jet-config"

--[ Mini-Plugins ]--
require("utils.pair").create { "()", "{}", "[]", "\"\"" }
require "utils.stline-mini"
