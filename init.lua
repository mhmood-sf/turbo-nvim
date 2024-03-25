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
vim.o.cul   = true    -- cursorline: Highlight current line.

vim.o.title = false   -- title: Don't set terminal title.
vim.o.wrap  = false   -- wrap: Dont wrap lines.

vim.o.so    = 9       -- scrolloff: 9 lines scroll offset.
vim.o.ls    = 2       -- laststatus: Always show one statusline.
vim.o.sts   = 4       -- softtabstop: 4 spaces as one tab.
vim.o.ts    = 4       -- tabstop: Number of cols in one tab char.
vim.o.sw    = 4       -- shiftwidth: Autoindent width.
vim.o.tw    = 80      -- textwidth: Max width, longer lines are broken up.
vim.o.cc    = "80"    -- colorcolumn: Highlight col to help align text.
vim.o.ff    = "unix"  -- fileformat: Unix file endings.
vim.o.spl   = "en_gb" -- spelllang: Set spelling language.

-- splitkeep: Keep topline same when scrolling windows.
vim.o.spk = "topline"
-- wildmode: Bash-like tab completion.
vim.o.wim = "longest,list"
-- undodir: Directory for the undofile
vim.o.udir = fn.stdpath("data") .. "/undo/"

--[ TeX FT Plugin Options ]--
vim.g.tex_flavor = "latex"

--[ Netrw Options ]--
vim.g.netrw_preview = 1
vim.g.newtrw_liststyle = 3
vim.g.netrw_winsize = 20

--[ Mappings ]--
vim.g.mapleader = " "

local opts = { noremap = true }

-- Enter to insert new line without leaving normal mode
map("n", "<Enter>", "o<Esc>", opts)

-- Avoid pressing shift all the time for ex commands
map("n", ";", ":", opts)

-- Use Esc to exit terminal-insert mode
map("t", "<Esc>", "<C-\\><C-n>", opts)

-- Arrow keys for window sizes
map("n", "<Up>",    "<C-W>+", opts)
map("n", "<Down>",  "<C-W>-", opts)
map("n", "<Right>", "<C-W>>", opts)
map("n", "<Left>",  "<C-W><", opts)

-- H: First non-blank char of line + center cursorline.
-- L: Last character of line + center cursorline.
map("n", "<S-h>", "^zz",     opts)
map("n", "<S-l>", "$zz",    opts)

-- J: Scroll downwards based on 'scroll' option
-- K: Scroll upwards based on 'scroll' option
map("n", "<S-j>", "<C-d>M", opts)
map("n", "<S-k>", "<C-u>M", opts)

-- <C-hjkl> for splits!
map("n", "<C-h>", "<CMD>vsplit<CR>", opts)
map("n", "<C-k>", "<CMD>split<CR>", opts)
map("n", "<C-l>", "<CMD>vsplit<CR><C-w>l", opts)
map("n", "<C-j>", "<CMD>split<CR><C-w>j", opts)

-- <Esc> to clear search highlighting
map("n", "<Esc>", "<CMD>nohlsearch|diffupdate<CR><C-L>", opts)

--[ Editor Commands ]--
cmd "command! -nargs=0 InitLua edit $MYVIMRC"

--[ Plugins ]--
-- We load these near the end, so that any plugin-related global variables are
-- defined before the plugins are loaded.
require "jet-config"

--[ Mini-Plugins ]--
require("utils.pair").create { "()", "{}", "[]", "\"\"" }
require("utils.stline")
