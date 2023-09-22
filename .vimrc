syntax on
filetype plugin indent on
set showcmd
set termbidi
set hidden

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on

" YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_python_binary_path='/usr/bin/python3'

" Remember info about open buffers on close
set viminfo^=%

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
	 \ endif

map <F12> :NERDTreeToggle<CR>
" open NERDTree automatically when vim starts up on opening a directory

"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") |
"	\exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
"
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
			\ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif


let g:pymode_lint_config = '$HOME/.pylint.rc'
let g:pymode_options_max_line_length=120

nnoremap <C-PageUp> :bp<CR>
inoremap <C-PageUp> <Esc>:bp<CR>i
nnoremap <C-PageDown> :bn<CR>
inoremap <C-PageDown> <Esc>:bn<CR>i
nnoremap <C-w> <Esc>:bd<CR>

call plug#begin()
Plug 'Valloric/YouCompleteMe'
Plug 'dense-analysis/ale'
Plug 'davidhalter/jedi-vim'
Plug 'itchyny/lightline.vim'
Plug 'frazrepo/vim-rainbow'
Plug 'preservim/nerdtree'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
call plug#end()

inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha

" Set vertical split append to the right hand
set splitright

" Set line number
set number

"Set command prompt height by 2 lines
set cmdheight=2

" Set backspace to delete whole empty indention
set backspace=start,eol,indent

" Highlighted the line that cursor is on it
set cursorline

" Window Navigation with Ctrl-[hjkl]
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Set auto indent
set autoindent
set shiftwidth=4
filetype plugin indent on

" Set tab for 4 spaces
set tabstop=4

" Set History equal to 1000
set history=1000

" Set Search highlighting
set hlsearch

" Set ignore case when searching
set ignorecase 

" Avoid Wrapping line in the middle of a word
set linebreak
" Set Number width

set clipboard^=unnamed,unnamedplus
"The number of screen lines to keep above and below the cursor
set scrolloff=2


vnoremap <C-c> "+y
map <C-p> "+p
" Set a width line numbers
set numberwidth=7

" Set Encoding in Unicode
set encoding=utf-8

" Set Wrapping
set wrap

" Set Status Bar
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

" Set Bracket or parenthesis matches
set showmatch

" Improve for dark backgrounds
set t_Co=256
set cursorline
colorscheme onehalfdark
let g:lightline = { 'colorscheme': 'onehalfdark' }
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Set items for status line
"set statusline+=\ path:\ %F
"set statusline+=%=\ ASCII:\ %b\ Row:\ %l\ Col:\ %c  


let g:rainbow_active = 1

let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

hi statusline guibg=White ctermfg=15 guifg=OrangeRed4 ctermbg=243


" ALE is an async linter for vim
" you should install `vim-ale`
packadd! ale

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

" show warnings and errors count in statusline
" airline has a built-in support for this
"function! LinterStatus() abort
"  let l:counts = ale#statusline#Count(bufnr(''))
"  let l:all_errors = l:counts.error + l:counts.style_error
"  let l:all_non_errors = l:counts.total - l:all_errors
"  return l:counts.total == 0 ? '✨ all good ✨' : printf(
"        \   '😞 %dW %dE',
"        \   all_non_errors,
"        \   all_errors
"        \)
"endfunction
"set statusline=
"set statusline+=%m
"set statusline+=\ %f
"set statusline+=%=
"set statusline+=\ %{LinterStatus()}

"set a button for fix
nmap <F10> :ALEFix<CR>

"auto fix on saving files
let g:ale_fix_on_save = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '*'
let g:ale_completion_enabled = 1
let g:ale_warn_about_trailing_whitespace = 1
let g:ale_virtualtext_cursor = 'current'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
