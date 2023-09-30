set nocompatible

call plug#begin()

Plug 'VundleVim/Vundle.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'dense-analysis/ale'

call plug#end()

set nu
syntax on

set incsearch
set hlsearch
set autoindent
set shiftwidth=4
set expandtab

set tabstop=4

set linebreak
set scrolloff=2

set numberwidth=7

set nospell
set wrap
set showmatch

set termwinsize=12x0
set termwinsize=12x0
set splitbelow
set encoding=utf8
set clipboard=unnamedplus
set hidden
set number " Shows the line numbers
set splitbelow splitright " Change the split screen behavior
set title " Show file title
set wildmenu " Show a more advance menu
set guifont=hack_nerd_font:h11
"set cc=100
filetype plugin indent on
syntax on
set spell

let g:kite_supported_languages = ['python', 'javascript']

let g:bargreybars_auto=0
let g:airline_solorized_bg='dark'
let g:airline_powerline_fonts=1
let g:airline#extension#tabline#enable=1
let g:airline#extension#tabline#left_sep=' '
let g:airline#extension#tabline#left_alt_sep='|'
let g:airline#extension#tabline#formatter='unique_tail'
let NERDTreeQuitOnOpen=1

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodeDefaultSymbol = '#'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['nerdtree'] = '#'


"ALE
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
let g:ale_fix_on_save = 1

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Always show the status line
set laststatus=2

" specify linters for languages
" you should have them installed
let g:ale_linters = {
	\'python': ['flake8', 'pylint'],
	\}

" specify fixers for languages
" you should have them installed
let g:ale_fixers = {
	\'python': ['black', 'autoimport'],
	\}

set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStatus()}

"set a button for fix
nmap <F10> :ALEFix<CR>

" Developer Sign
if !exists("autocommands_loaded")
	let autocommands_loaded = 1
endif
au BufNewFile *.py 0r ~/.vim/skeleton.py
