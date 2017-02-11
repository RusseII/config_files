
filetype off

" Vundle Plugins ------------ {{{
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'leafgarland/typescript-vim.git'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tomtom/tcomment_vim'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Townk/vim-autoclose'
"tmux vim navigator
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'
Plugin 'chriskempson/base16-vim'
Plugin 'nanotech/jellybeans.vim'
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}

let mapleader = ','
let maplocalleader = "\\"
set foldlevelstart=0

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" Vimscript file settings ----------------- {{{
" augroup filetype_vim
"     autocmd!
"     autocmd FileType vim setlocal foldmethod=marker
" augroup END
" }}}

" Basic Settings ----------- {{{
" Always show statusline
"set laststatus=2


 set t_Co=256
" set background=dark
colorscheme elflord

set laststatus=2

let g:airline_detect_modified=1

syntax on

set nowrap
set sidescroll=5
set listchars+=precedes:<,extends:>

set backspace=indent,eol,start
set ruler
set showcmd
set showmatch
" set nowrap
"set backupdir=~/.tmp
"set directory=~/.tmp

set sw=4
set expandtab
set smarttab
set ignorecase smartcase
set number

highlight LineNr ctermfg=grey

autocmd FileType html,javascript setlocal ai ts=2 sw=2 sts=2 et

" }}}

" Since I always accidentally type W instead of w
" command W :write

nnoremap <leader>f :call FoldColumnToggle()<cr>

function! FoldColumnToggle()
    if &foldcolumn
        setlocal foldcolumn=0
    else
        setlocal foldcolumn=4
    endif
endfunction


nnoremap <leader>q :call QuickfixToggle()<cr>

let g:quickfix_is_open=0

function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open=0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open=1
    endif
endfunction


" Autocommands -------------------- {{{
" Add automatic commenting functions
autocmd FileType python nnoremap <buffer> <leader>c I#<esc>
autocmd FileType javascript nnoremap <buffer> <leader>c I//<esc>
" }}}

" Normal Mode Mappings ---------- {{{

"Source the vimrc file and write to the vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" command to delete current lines and paste before and after the current line
nnoremap <leader>- ddp
nnoremap <leader>_ ddP

" erase current line
nnoremap <leader>e ddO<esc>

" Mapping to insert " and ' around a word
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel"  
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel'
nnoremap <leader>( viw<esc>a)<esc>hbi(<esc>lel(

"Use H to go to the begging of a line and L to go to the end
nnoremap H 0
nnoremap L $

vnoremap H 0
vnoremap L $
"Add a semicolon on the end of the line and return to the previous cursor
"position
nnoremap <leader>; mqA;<esc>'q

"Grep search for the string under the current word and open a quick fix window
"with the results
" nnoremap <leader>g :silent execute "grep! -R ". shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>

" }}}

" Insert Mode Mappings ---------------------- {{{
"Change how to exit insert mode
inoremap jk <esc>
" inoremap <esc> <nop>

inoremap <leader><c-u> <esc>viwUi
inoremap <leader><c-d> <esc>ddi
" }}}

" Visual Mode mappings --------------------- {{{
" in visual mode surround highlighted text with " or '
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>`>ll
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>`>ll

" }}}


" Buffer Mappings ------------------------- {{{
" Type leader lb to open the last buffer in a split right below the current
" split
nnoremap <leader>lb :execute "rightbelow vsplit " . bufname("#") <cr>

" }}}

" Operator Mappings --------------- {{{
" Find next ( and change inside and around it
" Find previous ( and change inside and around it
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>

onoremap an( :<c-u>normal! f(va(<cr>
onoremap al( :<c-u>normal! F)va(<cr>

" Find next { and change inside and around it
" Find previous { and change inside and around it
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>

onoremap an{ :<c-u>normal! f{va{<cr>
onoremap al{ :<c-u>normal! F}va{<cr>
" }}}

" Vim and tmux settings ----- {{{
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"Custom Key Bindings for vim and tmux
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

"makes all copys global
"set clipboard=unnamedplus
let g:tmux_navigator_save_on_switch = 1
" }}}
