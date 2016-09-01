" ==== Leader {{{
let mapleader=","                        " leader is comma
" }}}
" ==== Plugins {{{
set nocompatible  
filetype off

set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin()               " alternatively, pass a path where Vundle should install programs

Plugin 'VundleVim/Vundle.vim'     " Vundle managing Vundle
Plugin 'tpope/vim-fugitive'       " git integration
Plugin 'scrooloose/syntastic'     " syntax checker
Plugin 'valloric/youcompleteme'   " autocompletion
Plugin 'ternjs/tern_for_vim'      " JavaScript autocompletion engine

Plugin 'scrooloose/nerdtree'      " Nerdtree
Plugin 'bling/vim-airline'        " Vim airline

Plugin 'flazz/vim-colorschemes'   " coloscheme pack

call vundle#end()                 " all plugins must be added before the following line
filetype plugin on

" === Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

" better error and warning signs
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='!'

let g:syntastic_python_checkers=["flake8"]  " specify which checker to use on python files
" }}}
" === YouCompleteMe {{{
let g:ycm_python_binary_path = '/usr/bin/python3' " specify in which runtime to invoke the jedi instance
let g:ycm_min_num_of_chars_for_completion = 1     " start autocompletion after how many chars
let g:ycm_filetype_whitelist = {'python':1}       " for which filetypes shoud YCM start
let g:ycm_add_preview_to_completeopt=0            " do not show preview split
set completeopt-=preview                          " REALLY don't show it
let g:ycm_autoclose_preview_window_after_completion=0
" }}}
" === NERDTree {{{
" open NERDTree with leader+t
nnoremap <leader>t :NERDTree<CR>
" ignore the following from NERDTree
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$', '^__init__.py$']
" }}}
" === Airline {{{
set laststatus=2                         " the status line show always be visible
let g:airline_powerline_fonts=1          " let airline use the special font symbols
" }}}
" }}} 
" ==== Colors {{{
colorscheme molokai
syntax on                                " enable syntax processing
set colorcolumn=80                       " highlight the 80th column
" }}}
" ==== Spaces & Tabs {{{
set tabstop=4                            " number of visual spaces per tab
set softtabstop=4                        " number of spaces in tab when editing
set shiftwidth=4                         " when indenting with >
set expandtab                            " tabs are spaces
set listchars=trail:·                    " mark trailing whitespace
set list
highlight NonText guifg=#ffffff
highlight SpecialKey guifg=#ffffff
" }}}
" ==== UI {{{
set number                               " show line numbers
set showcmd                              " show command in bottom bar
set cursorline                           " highlight current line
filetype indent on                       " load filetype-specific indent files

set wildmenu                             " visual autocomplete for command menu
"set lazyredraw                           " redraw only when we need to
set noshowmatch                          " no blinking matching [{()}]
" }}}
" ==== Searching {{{
set incsearch                            " search as characters are entered
set hlsearch                             " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" }}}
" ==== Folding {{{
set foldenable                           " enable folding
set foldlevelstart=10                    " open most folds by default
set foldnestmax=10                       " 10 nested folds at maximum
" space open/closes folds
nnoremap <space> za
set foldmethod=indent                    " fold based on indent level

set modeline
set modelines=5
" }}}
" ==== Movement {{{
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]
" }}}
" vim:foldmethod=marker:foldlevel=0
