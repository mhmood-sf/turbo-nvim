" =============================================================================
" === Common ==================================================================
" =============================================================================
set nocompatible           " disable compatibility to old-time vim
set showmatch              " show matching brackets
set ignorecase             " case insensitive matching
set mouse=v                " middle-click paste with mouse
set hlsearch               " highlight search results
set tabstop=4              " number of columns occupied by a tab character
set softtabstop=4          " set multiple spaces as tabstops
set expandtab              " converts tabs to whitespace
set shiftwidth=4           " width for autoindents
set autoindent             " indent new line the same as the last line
set number                 " add line numbers
set ruler                  " show line number on bar
set wildmode=longest,list  " get bash-like tab completions
set cc=80                  " set an 80-column border for good coding style
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

let g:home_dir = fnamemodify($MYVIMRC, ':p:h')

" =============================================================================
" === Mappings / Autocmds =====================================================
" =============================================================================
noremap ; :

" Use Esc to exit terminal-insert mode
tmap <Esc> <C-\><C-n>

" Arrow keys for split sizes
" Up    - increase height
" Down  - decrease height
" Right - increase width
" Left  - decrease width
nnoremap <Up> <C-W>+
nnoremap <Down> <C-W>-
nnoremap <Left> <C-W><
nnoremap <Right> <C-W>>

" =============================================================================
" === Plugins =================================================================
" =============================================================================

call plug#begin(g:home_dir . "/pack/plugged/start")
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'vimwiki/vimwiki'
call plug#end()

call glup#begin(g:home_dir)

GlupGroup "quintik"
    GlupOpt "https://github.com/quintik/qline"
    GlupOpt "https://github.com/qunitik/snap"
GlupGroup "plugged"
    Glup "https://github.com/ervandew/supertab"
    Glup "https://github.com/jiangmiao/auto-pairs"
    Glup "https://github.com/vimwiki/vimwiki"

call glup#end()

" Allow Snap to parse larger files
set maxfuncdepth=200

" TeX options
let g:tex_flavor = 'latex'
let g:tex_viewer = 'SumatraPDF.exe'
let g:tex_preamble = g:home_dir . "/preamble.tex"

" VimWiki Settings
if has('win32')
    let g:vimwiki_list = [#{path: 'E:/_/Notes/wiki', html: 'E:/_/Notes/wikihtml'}]
elseif has('unix')
    let g:vimwiki_list = [#{path: '/mnt/e/_/Notes/wiki', html: '/mnt/e/_/Notes/wikihtml'}]
endif

" =============================================================================
" === Theme ===================================================================
" =============================================================================

" Themes: default, nord, onedark
colorscheme nord

