" =============================================================================
" === Common ==================================================================
" =============================================================================
set nocompatible           " Disable compatibility to old-time vim
set showmatch              " Show matching brackets
set ignorecase             " Case insensitive matching
set hlsearch               " Highlight search results
set tabstop=4              " Number of columns occupied by a tab character
set softtabstop=4          " Set multiple spaces as tabstops
set expandtab              " Converts tabs to whitespace
set shiftwidth=4           " Width for autoindents
set autoindent             " Indent new line the same as the last line
set number                 " Add line numbers
set ruler                  " Show cursor position in default statusline
set cc=80                  " Set color column for cleaner code
set wildmode=longest,list  " Get bash-like tab completions
set termguicolors          " Use 24-bit RGB colors (see :help tgc)
set cursorline             " Highlight current line
set notitle                " Do not set terminal title
set nowrap                 " Do not wrap lines by default
set laststatus=2           " Always show statusline
set showtabline=2          " Always show tabline
set spelllang=en_gb        " Set spelling language
set complete+=k            " Enable dictionary words in completion list
set list                   " Show trailing whitespace
set ff=unix                " Use unix file endings

filetype plugin indent on  " allows autoindenting depending on filetype
syntax on                  " syntax highlighting

let g:home_dir = fnamemodify($MYVIMRC, ":p:h")

" Save undo tree
set undofile
execute "set undodir=" . g:home_dir . "/undo/"

" =============================================================================
" === Mappings / Autocmds =====================================================
" =============================================================================
noremap ; :

" Use Esc to exit terminal-insert mode
tmap <Esc> <C-\><C-n>

" Window sizes
" Up/Down    - +/- height
" Right/Left - +/- width
nnoremap <Up> <C-W>+
nnoremap <Down> <C-W>-
nnoremap <Left> <C-W><
nnoremap <Right> <C-W>>

" Highlighting for ejs files
autocmd BufNewFile,BufRead *.ejs set filetype=html

" =============================================================================
" === Plugins =================================================================
" =============================================================================

lua << EOF
require "jet/jet"

-- Initialize glup
Jet.pack(vim.g.home_dir)

-- My own plugins
local quintik = Jet.group "quintik"

quintik:start {
    "git@github.com:quintik/qline",
    "git@github.com:quintik/Snip"
}

-- Other plugins
local jet = Jet.group "jet"

jet:start {
    "git@github.com:ervandew/supertab",
    "git@github.com:vimwiki/vimwiki"
}

--[[
local test = Jet.group "test"

test:start {
    "uri",

    {
        uri = "uri",
        name = "gloop",
        flags = { "--depth", "1", "--branch", "feature/xclip" }
    }
}

test:opt {
    "uri",

    {
        uri = "uri",
        name = "glopt",
        args = { "--depth", "1", "--branch", "feature/xclip" },
        load_evt = "CmdUndefined",
        load_fn = function(match, _buf, _file) return match == "Telescope" end,
        post_load = function() print("Telescope loaded.") end,
        post_install = function() print("Telescope installed.") end
    }
}
--]]
EOF

" Allow Snap to parse larger files
set maxfuncdepth=200

" TeX options
let g:tex_flavor   = "latex"
let g:tex_viewer   = "SumatraPDF.exe"
let g:tex_conceal  = "d"
let g:tex_preamble = g:home_dir . "/preamble.tex"

" VimWiki Settings
if has("win32")
    let g:vimwiki_list = [#{path: "E:/_/Notes/wiki", html: "E:/_/Notes/wikihtml"}]
elseif has("unix")
    let g:vimwiki_list = [#{path: "/mnt/e/_/Notes/wiki", html: "/mnt/e/_/Notes/wikihtml"}]
endif

" =============================================================================
" === Theme ===================================================================
" =============================================================================

" Themes: default, nord, onedark
colorscheme onedark

