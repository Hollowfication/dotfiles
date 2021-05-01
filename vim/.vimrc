"""""""General Settings""""""
"""""""""""""""""""""""""""""   
set regexpengine=1
set nocompatible " Set compatibility to Vim only.
filetype off " Helps force plug-ins to load correctly when it is turned back on below.
filetype plugin indent on " For plug-ins to load correctly.
set wrap
set wildmenu
" Vim's auto indentation feature does not work properly with text copied from outisde of Vim. Press the <F2> key to toggle paste mode on/off.
"nnoremap <F2> :set invpaste paste?<CR>
"imap <F2> <C-O>:set invpaste paste?<CR>
"set pastetoggle=<F2>

" set tabs to have 4 spaces
set noswapfile  " disable swap file

set formatoptions=tcqrn1
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set showmatch   " set show matching parenthesis
" Fixes common backspace problems
set backspace=indent,eol,start
set lazyredraw
set laststatus=2
" Display options
set showmode
set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

au FileType tex setlocal nocursorline
au FileType tex :NoMatchParen

" Show line numbers
set number

" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Automatically save and load folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview"
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

"""""""Key Mappings"""""""
""""""""""""""""""""""""""

inoremap jj <esc>

let g:pymode_run_bind='<F5>'
imap <F5> <Esc>:w<Cr>:!clear;python %<Cr>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"""""""Plugins"""""""
"""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_complete_commands =1
Plug 'sirver/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
"Plug 'honza/vim-snippets'
let g:UltiSnipsUsePythonVersion = 3


if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

Plug 'tpope/vim-fugitive'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'itchyny/lightline.vim'
Plug 'arzg/vim-colors-xcode'
Plug 'dylanaraps/wal'

Plug 'davidhalter/jedi-vim'

Plug 'nvie/vim-flake8'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'sheerun/vim-polyglot'

Plug'alvan/vim-closetag'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

"Plug 'tpope/vim-surround'
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'

call plug#end()

syntax on " Turn on syntax highlighting.
"colorscheme dracula
colorscheme wal

let g:lightline = { 'colorscheme': 'nightfly' }
