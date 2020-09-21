"""""""""""""""""""""""""""""""""""""""""""""""{{{
" Dominic Boiko's .vimrc
" 
" Inspired by:
"   https://github.com/amix/vimrc
"   https://raw.githubusercontent.com/theshteves/dotfiles/master/.vimrc
" 
" Raw version:
"   
" 
" Navigating this .vimrc w/folds:
"   I provided manual fold markers so you can shrink and expand this file at 
"   your pleasure so first enable folding in you current buffer:
"   
"   	:set foldmethod=marker
"
"	Now you can press "za" within any Section to shrink/expand multiple lines
"
" Sections:
"   -> General
"   -> User Interface
"   -> Colors & Fonts
"   -> Text, Tab, & Indent-related
"   -> Tabs, Windows, & Buffers
"   -> Status Line
"   -> Mapping Edits
"   -> Files & Backups
"   -> Macros
" 
"""""""""""""""""""""""""""""""""""""""""""""""}}}
"
" GENERAL
"
"""""""""""""""""""""""""""""""""""""""""""""""{{{
" Begin Vundle Package Manager load
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" End Vundle load

" Begin Plugins load
Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/seoul256.vim'
Plugin 'taylor/vim-zoomwin'
Plugin 'scrooloose/nerdtree'
Plugin 'romgrk/winteract.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'Conque-GDB'
"End Plugins load

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" sets number of lines for vim to remember
set history=200

" Enable auto-indenting based on filetype
filetype indent on

"""""""""""""""""""""""""""""""""""""""""""""""}}}
"
" USER INTERFACE
"
"""""""""""""""""""""""""""""""""""""""""""""""{{{
" avoid messy non-english characters 
let $LANG='en'
set langmenu=en

" Enable command-line auto-completions
set wildmenu
set wildmode=longest:list,full

" Ignore files (compiled, etc.)
set wildignore=*.o,*~,*.pyc,.git\*

" Line numbers... everywhere...
set number

" Prints current cursor position on status line
set ruler

" Highlight search results
set hlsearch

" Incremental search
set incsearch

" Make backspace WORK like you'd expect
set backspace=indent,eol,start

" Show matching brackets when text indicator is over them
set showmatch

" show entered key presses
set showcmd
"""""""""""""""""""""""""""""""""""""""""""""""}}}

" COLORS & FONTS
"
"""""""""""""""""""""""""""""""""""""""""""""""{{{
" Enable syntax highlighting
syntax on

" Sets the background theme (most prefer 'dark')
set bg=light

" Sets UTF-8 as standard encoding 
set encoding=utf8

" Sets cursor line highlight
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" Set colo theme to seoul256
let g:seoul256_background = 233
colo seoul256
"""""""""""""""""""""""""""""""""""""""""""""""}}}
"
" TEXT, TAB, & INDENT-RELATED
"
"""""""""""""""""""""""""""""""""""""""""""""""{{{
" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2
set expandtab

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""}}}
"
" TABS, WINDOWS, & BUFFERS
"
"""""""""""""""""""""""""""""""""""""""""""""""{{{
" 'up' & 'down' no longer skip long lines that overflow
set hidden
map j gj
map k gk

"""""""""""""""""""""""""""""""""""""""""""""""}}}

" STATUS LINE
"
"""""""""""""""""""""""""""""""""""""""""""""""{{{
" Always show the status line
set laststatus=2

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" function! HasPaste()
"     if &paste
"         return 'PASTE MODE  '
"     endif
"     return ''
" endfunction
" change lighline colorscheme
let g:lightline = {
  \ 'colorscheme': 'seoul256',
  \ }

"""""""""""""""""""""""""""""""""""""""""""""""}}}

" MAPPING EDITS
"
"""""""""""""""""""""""""""""""""""""""""""""""{{{
" Smart way to move between windows
" map <C-j> <C-W>j
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" map <C-l> <C-W>l
" Update vim tab hotkeys
"nnoremap th  :tabfirst<CR>
"nnoremap tk  :tabnext<CR>
"nnoremap tj  :tabprev<CR>
"nnoremap tl  :tablast<CR>
"nnoremap tt  :tabedit<Space>
"nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap tx  :tabclose<CR>
nnoremap to  :tabonly<CR>
" Alternatively use
nnoremap tf :tabfirst<CR>
nnoremap te :tablast<CR>
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tn :tabnew<CR>
nnoremap tt :tabs<CR>

map <C-n> :NERDTreeToggle<CR>

" InteractiveWindow plugin mappings
nmap gw        :InteractiveWindow<CR>
" or
nmap <leader>w :InteractiveWindow<CR>

" map CtrlPBuffer
nnoremap <Leader>b :CtrlPBuffer<CR>

" refresh cscope
map <F12> :!cscope -Rbq<CR>:cs reset<CR><CR> 

" jump to the previous function
"nnoremap <silent> [f :call
"      \ search('\(\(if\\|for\\|while\\|switch\\|catch\)\_s*\)\@64<!(\_[^)]*)\_[^;{}()]*\zs{', "bw")<CR>
" jump to the next function
"nnoremap <silent> ]f :call
"      \ search('\(\(if\\|for\\|while\\|switch\\|catch\)\_s*\)\@64<!(\_[^)]*)\_[^;{}()]*\zs{', "w")<CR>

" Map fuzzy finder to ctrl-p
"map <C-p> :Files<CR>
nmap <F8> :TagbarToggle<CR>
"""""""""""""""""""""""""""""""""""""""""""""""}}}
"
" HELPFUL MACROS
"
"""""""""""""""""""""""""""""""""""""""""""""""{{{
"h - turns word into html tags
let @h="yiWi<pa></Ea>Bf<"

"c - compute arithmetic and paste after equals sign
let @c="yt=f=a =0"

"q - surround word in quotes
let @q="viwa\"hbi\"lel"
" Ignores capital-typos when you want to write/quit
" Not many people about this but you'll definitely thank me
" Inspired by: http://alexander-hill.tumblr.com/post/78142366738/how-to-fix-the-capital-w-annoyance-in-vim
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q

" YouCompleteMe
"let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
"let g:ycm_use_clangd = 0

" Ctrlp
let g:ctrlp_max_files = 500000

" Conque-GDB
let g:ConqueTerm_Color = 2         " 1: strip color after 200 lines, 2: always with color
let g:ConqueTerm_CloseOnEnd = 1    " close conque when program ends running
let g:ConqueTerm_StartMessages = 0 " display warning messages if conqueTerm is configured incorrectly
