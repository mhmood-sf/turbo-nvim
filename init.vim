" Author: quintik <https://github.com/quintik>

let g:home_dir = fnamemodify($MYVIMRC, ":p:h")

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

" Save undo tree
set undofile
execute "set undodir=" . g:home_dir . "/undo/"

filetype plugin indent on  " Allow autoindenting depending on filetype
syntax on                  " Syntax highlighting

" =============================================================================
" === Mappings / Autocmds =====================================================
" =============================================================================

" Use space/backspace to repeat f/F/t/T motions
nnoremap <Space> ;
nnoremap <BS> ,

" Avoid having to press shift all the time
nnoremap ; :

" Use Esc to exit terminal-insert mode
tmap <Esc> <C-\><C-n>

" Window sizes
" Up/Down: +/- height
" Right/Left: +/- width
nnoremap <Up> <C-W>+
nnoremap <Down> <C-W>-
nnoremap <Left> <C-W><
nnoremap <Right> <C-W>>

" Highlighting for ejs files
autocmd BufNewFile,BufRead *.ejs set filetype=html

" =============================================================================
" === Plugins =================================================================
" =============================================================================

" Plugin Manager: https://github.com/quintik/jet
lua << EOF
require "jet/jet"

-- Initialize jet
Jet.pack { path = vim.g.home_dir, ssh = "~/.ssh/id_rsa" }

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
    "git@github.com:vimwiki/vimwiki",
    "git@github.com:mhinz/vim-startify",
}

EOF

" Allow Snip to parse larger files
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

" Startify Settings
let g:startify_lists = [
      \ { 'type': 'files',    'header': ['   Recently used'] },
      \ { 'type': 'dir',      'header': ['   Recently used in '. getcwd()] },
      \ ]

let g:startify_enable_special = 0
let g:startify_change_to_dir = 0
let g:startify_padding_left = 10
let g:startify_files_number = 5
let g:startify_custom_header = startify#pad(readfile('./startify.txt'))

" =============================================================================
" === Theme ===================================================================
" =============================================================================

" Installed Themes:
" nord: https://github.com/arcticicestudio/nord-vim/
" onedark: https://github.com/joshdick/onedark.vim
colorscheme onedark

