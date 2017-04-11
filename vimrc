"-----------------------------------------------------------------------------
" Vim Starter Configuration (Dotfiles)
"
" Project : .vimrc configuration for a starter
" Last modified by Jerry Jia on 2017-04-09
"-----------------------------------------------------------------------------

"-----------------------------------------------------------------------------
" Vundle Config
"-----------------------------------------------------------------------------

set nocompatible
filetype off

" Setting up Vundle
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
" Color scheme
Bundle 'jnurmine/Zenburn'
Bundle 'altercation/vim-colors-solarized'
Bundle 'sickill/vim-monokai'
Bundle 'flazz/vim-colorschemes'
" Word surround
Bundle 'tpope/vim-surround'
" Code folding
Bundle 'tmhedberg/SimpylFold'
" Indent line
Bundle 'Yggdroot/indentLine'
" Git interface
Bundle 'tpope/vim-fugitive'
" Flie system
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
" Show trailing white space
Bundle 'bitc/vim-bad-whitespace'
" Python syntax checker
Bundle 'scrooloose/syntastic'
Bundle 'nvie/vim-flake8'
Bundle 'jiangmiao/auto-pairs'
Bundle 'tell-k/vim-autopep8'
" Auto-completion stuff
" Bundle 'Valloric/YouCompleteMe'
Bundle 'davidhalter/jedi-vim'
"Bundle 'snipMate'
" Airline
Bundle 'bling/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
" Commenter
Bundle 'scrooloose/nerdcommenter'
" Installing plugins the first time
" If exists, skip
if has_vundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

filetype plugin indent on

"-----------------------------------------------------------------------------
" Color theme and outlook
"-----------------------------------------------------------------------------

set shortmess=atI                                     "去掉欢迎界面
" set gcr=a:blinkon0                                  "禁止光标闪烁
"set guicursor=i:block-iCursor-blinkon0,v:block-vCursor
set cursorline                                        "突出显示当前行"

" Line numbering
set number

" Color scheme
if has('gui_running')
    set background=light
    colorscheme solarized
else
    colorscheme monokai
    "colorscheme solarized
    set background=dark
endif

"-----------------------------------------------------------------------------
" Encoding and general usability
"-----------------------------------------------------------------------------

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

let &t_Co=256

" auto source configuration when saving
autocmd! BufWritePost $MYVIMRC source $MYVIMRC

" If a file has been changed outside of Vim, reload it inside of Vim
set autoread

" enable os clipboard
set clipboard=unnamed

" make backspaces more powerfull
set backspace=indent,eol,start

set scrolloff=10

"-----------------------------------------------------------------------------
" Buffers
"-----------------------------------------------------------------------------

set writebackup
set nobackup
set noswapfile

"-----------------------------------------------------------------------------
" Spacing
"-----------------------------------------------------------------------------

set smartindent                                       "启用智能对齐方式
set expandtab                                         "将Tab键转换为空格
set tabstop=4                                         "设置Tab键的宽度
set shiftwidth=4                                      "换行时自动缩进4个空格
set smarttab                                          "指定按一次backspace就删除shiftwidth宽度的空格"

"-----------------------------------------------------------------------------
" Keymap stuff
"-----------------------------------------------------------------------------

nnoremap H ^
nnoremap L $

" inoremap jk <ESC>
"inoremap <C-k> <Up>
"inoremap <C-j> <Down>
"inoremap <C-h> <Left>
"inoremap <C-l> <Right>

" 常规模式下输入 cS 清除行尾空格
nmap cS :%s/\s\+$//g<CR>:noh<CR>

" 常规模式下输入 cM 清除行尾 ^M 符号
nmap cM :%s/\r$//g<CR>:noh<CR>"

" 重新绑定大小写转换功能的快捷键
nnoremap gu gU
nnoremap gl gu

" 调换 a 和 A 的功能
nnoremap a A
nnoremap A a

" 物理行上直接切换
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" split navigations
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>

" Enable folding
set foldmethod=indent
set foldlevel=99

nnoremap <space> za
nnoremap <space> zo

"-----------------------------------------------------------------------------
" Search, highlight, spelling, etc.
"-----------------------------------------------------------------------------

" Improved searching
nnoremap / /\v
vnoremap / /\v

set ignorecase                                        "搜索模式里忽略大小写
set smartcase                                         "如果搜索模式包含大写字符，不使用 'ignorecase' 选项，只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用
set noincsearch                                       "在输入要搜索的文字时，取消实时匹配"

"-----------------------------------------------------------------------------
" Strip trailing white spaces
"-----------------------------------------------------------------------------


"-----------------------------------------------------------------------------
" Python syntax
"-----------------------------------------------------------------------------

let python_highlight_all=1
syntax on

" 启用每行超过80列的字符提示（字体变蓝并加下划线），不启用就注释掉
au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)

" PEP8 style
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

" spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=79

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

"-----------------------------------------------------------------------------
" Run
"-----------------------------------------------------------------------------

"按F5运行"
map <F5> :call RunScripts()<CR>
function! RunScripts()
    exec "w"
    if &filetype == 'python'
        exec '!time python3 %'
    elseif &filetype == 'html'
        exec "!'google chrome' % &"
    elseif &filetype == 'sh'
        exec '!time bash %'
    endif
endfunction

"-----------------------------------------------------------------------------
" Plugin setting
"-----------------------------------------------------------------------------

"custom keys
let mapleader=","

"-----------------------------------------------------------------------------
" NerdTree
"-----------------------------------------------------------------------------

"F2开启和关闭树
map <F2> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
"显示书签
let NERDTreeShowBookmarks=1
"设置忽略文件类型
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
"窗口大小
let NERDTreeWinSize=25

"-----------------------------------------------------------------------------
" Airline tabs
"-----------------------------------------------------------------------------

let g:airline_theme = 'luna'

let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

set laststatus =2

"-----------------------------------------------------------------------------
" Indent line & autopep8
"-----------------------------------------------------------------------------
"缩进指示线
let g:indentLine_char='┆'
let g:indentLine_enabled = 1

"autopep8设置
let g:autopep8_disable_show_diff=1

"-----------------------------------------------------------------------------
" nerdcommenter
"-----------------------------------------------------------------------------
map <F4> <leader>ci <CR>

"-----------------------------------------------------------------------------
 "Ctrl P
"-----------------------------------------------------------------------------
let g:ctrlp_map = '<c-p>'

