"===================
" General
"===================
set nocompatible               " be iMproved
set filetype=unix

set history=256                " Number of things to remember in history.
set timeoutlen=250             " Time to wait after ESC (default causes an annoying delay)
set clipboard+=unnamed         " Yanks go on clipboard instead.
set pastetoggle=<F9>          " toggle between paste and normal: for 'safer' pasting from keyboard
set shiftround                 " round indent to multiple of 'shiftwidth'
set tags=./tags;$HOME          " walk directory tree upto $HOME looking for tags

set modeline
set modelines=5                " default numbers of lines to read for modeline instructions

set autowrite                  " Writes on make/shell commands
set autoread

set nobackup
set nowritebackup
set directory=/tmp//           " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)
set noswapfile                 "

set hidden                     " The current buffer can be put to the background without writing to disk

set hlsearch                   " highlight search
set smartcase                  " be case sensitive when input has a capital letter
set incsearch                  " show matches while typing

"let g:is_posix = 1             " vim's default is archaic bourne shell, bring it up to the 90s
let mapleader = ","

"===================
" Formatting
"===================
set fo+=o                      " Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set fo-=r                      " Do not automatically insert a comment leader after an enter
set fo-=t                      " Do no auto-wrap text using textwidth (does not apply to comments)

set nowrap
set textwidth=0                " Don't wrap lines by default

set tabstop=2                  " tab size eql 2 spaces
set softtabstop=2
set shiftwidth=2               " default shift width for indents
"set expandtab                  " replace tabs with ${tabstop} spaces
set smarttab                   "

set backspace=indent
set backspace+=eol
set backspace+=start

set autoindent
set cindent
set indentkeys-=0#            " do not break indent on #
set cinkeys-=0#
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do
set cinwords+=for,switch,case

"===================
" Visual
"===================
syntax on                      " enable syntax

set number                  " line numbers Off
highlight LineNr guifg=darkGrey ctermfg=darkGrey
set showmatch                 " Show matching brackets.
set matchtime=2               " Bracket blinking.

set wildmode=longest,list     " At command line, complete longest common string, then list alternatives.

set completeopt+=preview

set novisualbell              " No blinking
set noerrorbells              " No noise.
set vb t_vb=                  " disable any beeps or flashes on error

set laststatus=2              " always show status line.
set shortmess=atI             " shortens messages
set showcmd                   " display an incomplete command in statusline

" now use airline
set statusline=%<%f\          " custom statusline
set stl+=%m%r									" modified tag, readonly tag
set stl+=[%{&ff}]             " show fileformat
set stl+=[%{&fenc}]           " show fileencoding
set stl+=%y%=									" show type
set stl+=(%l:%c)char:%b\ %P


set foldenable                " Turn on folding
"set foldmethod=marker         " Fold on the marker
set foldlevel=100             " Don't autofold anything (but I can still fold manually)

set foldopen=block,hor,tag    " what movements open folds
set foldopen+=percent,mark
set foldopen+=quickfix

set splitbelow
set splitright
"set list                      " display unprintable characters f10 - switches
set listchars=tab:\ *
set listchars+=eol:]
set listchars+=trail:.
set listchars+=extends:>,precedes:<
map <silent> <F10> :set invlist<CR>

set mouse=a

if has('gui_running') || has('gui_vimr')
  set guioptions=cMg " console dialogs, do not show menu and toolbar
  set co=100
  set lines=30
  set mouse=a "enable mouse
  set mousehide                 " Hide mouse after chars typed
endif

"===================
" encoding
"===================
set fenc=utf-8    " file encoding
set fencs=ucs-bom,utf-8,cp949,cp932,euc-jp,shift-jis,big5,ucs-2le,latin1
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
	set tenc=utf-8
else
	set tenc=cp949
endif


"===================
" for korean
"===================
if has("multi_byte_ime")
	inoremap <ESC> <ESC>:set imdisable<CR>
	nnoremap i :set noimd<CR>i
	nnoremap I :set noimd<CR>I
	nnoremap a :set noimd<CR>a
	nnoremap A :set noimd<CR>A
	nnoremap o :set noimd<CR>o
	nnoremap O :set noimd<CR>O
	highlight CursorIM guibg=green guifg=NONE
	set iminsert=0
endif

"===================
" Key mappings
"===================

" Tabs
map <C-t> :tabnew<CR>
map <C-h> :tabprev<CR>
map <C-l> :tabnext<CR>

" Esc
inoremap ;; <Esc>

ab #e # encoding: UTF-8

"===================
" AutoCommands
"===================
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru}     set ft=ruby tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}                         set ft=markdown
au! BufReadPost       {COMMIT_EDITMSG,*/COMMIT_EDITMSG}               set ft=gitcommit noml list| norm 1G
au! BufWritePost      *.snippet                                       call ReloadAllSnippets()
" open help in vertical split
au BufWinEnter *.txt if &ft == 'help' | wincmd H | endif
" " }}}

"===================
" Vundle
"===================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"------------------
" Custom plugins
"------------------

" NERDTree
Plugin 'The-NERD-tree'

" Colorscheme
Plugin 'iCyMind/NeoSolarized'

" vim-airline (powerline)
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'bonsaiben/bootstrap-snippets'

" AutoComplPop
Plugin 'AutoComplPop'


"------------------
" End of Custom plugins
"------------------

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"========================
" Plugin settings
"========================

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" NERD tree
map <C-e> :NERDTreeToggle <CR>

" colorscheme
if has('gui_running') || has('gui_vimr')
  set background=dark
  colorscheme NeoSolarized
endif

" git gutter
let g:gitgutter_highlight_lines=1
