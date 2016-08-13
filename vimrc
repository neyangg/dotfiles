"-----------------------------------------------------------------------------
" Vim Starter Configuration (Dotfiles)
"-----------------------------------------------------------------------------

set nocompatible
set backspace=2
let &t_Co=256
syntax enable
filetype plugin indent on

"-----------------------------------------------------------------------------
" Vundle Config
"-----------------------------------------------------------------------------

" Setting up Vundle
" Found here: http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
let has_vundle=1
let vundle_readme=expand('~/.dotfiles/vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.dotfiles/vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.dotfiles/vim/bundle/vundle
    let has_vundle=0
endif

" Vundle setup config
set rtp+=~/.dotfiles/vim/bundle/vundle/
call vundle#rc()

" Required Bundle
Bundle 'gmarik/vundle'
" Additional Bundles go here"
"
Bundle 'flazz/vim-colorschemes'
" Installing plugins the first time
" If exists, skip
if has_vundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

"-----------------------------------------------------------------------------
" Encoding and general usability
"-----------------------------------------------------------------------------

" http://stevelosh.com/blog/2010/09/coming-home-to-vim/#important-vimrc-lines
set encoding=utf-8
set visualbell

colorscheme molokai

" Line numbering
set number

" If a file has been changed outside of Vim, reload it inside of Vim
set autoread

" Show tabs and trailing whitespace visually
if (&termencoding == "utf-8") || has("gui_running")
  if v:version >= 700
    set list listchars=tab:»·,trail:·,extends:…,nbsp:‗
  else
    set list listchars=tab:»·,trail:·,extends:…
  endif
else
  if v:version >= 700
    set list listchars=tab:>-,trail:.,extends:>,nbsp:_
  else
    set list listchars=tab:>-,trail:.,extends:>
  endif
endif

"-----------------------------------------------------------------------------
" Keymap stuff
"-----------------------------------------------------------------------------

nnoremap <Space> :
nnoremap H ^
nnoremap L $
nnoremap gu gU
nnoremap gl gu

" inoremap jk <ESC>
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

"-----------------------------------------------------------------------------
" Search, highlight, spelling, etc.
"-----------------------------------------------------------------------------

" Improved searching
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase

set incsearch

" Enable syntax highlighting, if one exists
if has("syntax")
    syntax on
endif

"-----------------------------------------------------------------------------
" Spacing
"-----------------------------------------------------------------------------

set autoindent
set smartindent
set tabstop=4 shiftwidth=4 expandtab

"-----------------------------------------------------------------------------
" Buffers
"-----------------------------------------------------------------------------

set writebackup
set nobackup
set noswapfile

