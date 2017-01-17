"-----------------------------------------------------------------------------
" Vim Starter Configuration (Dotfiles)
"-----------------------------------------------------------------------------

set nocompatible
filetype off

"-----------------------------------------------------------------------------
" Vundle Config
"-----------------------------------------------------------------------------

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
"Color scheme
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Bundle 'flazz/vim-colorschemes'
" Code folding
Bundle 'tmhedberg/SimpylFold'
Plugin 'Yggdroot/indentLine'
" Git interface
Plugin 'tpope/vim-fugitive'
" Fliesystem
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
" Python syntax checker
Plugin 'jiangmiao/auto-pairs'
Plugin 'tell-k/vim-autopep8'
" Auto-completion stuff
" Bundle 'Valloric/YouCompleteMe'
" Airline
Bundle 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
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
" Encoding and general usability
"-----------------------------------------------------------------------------

syntax enable

set encoding=utf-8
let &t_Co=256

set shortmess=atI                                     "去掉欢迎界面
" set gcr=a:blinkon0                                  "禁止光标闪烁
set guicursor=i:block-iCursor-blinkon0,v:block-vCursor
set cursorline                                        "突出显示当前行"

" Line numbering
set number

" make backspaces more powerfull
set backspace=indent,eol,start

" If a file has been changed outside of Vim, reload it inside of Vim
set autoread

" enable os clipboard
set  clipboard=unnamed

" Color scheme
if has('gui_running')
    set background=dark
    colorscheme solarized
else
    colorscheme Zenburn
endif

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
" Spacing
"-----------------------------------------------------------------------------

set smartindent                                       "启用智能对齐方式
set expandtab                                         "将Tab键转换为空格
set tabstop=4                                         "设置Tab键的宽度
set shiftwidth=4                                      "换行时自动缩进4个空格
set smarttab                                          "指定按一次backspace就删除shiftwidth宽度的空格"

"-----------------------------------------------------------------------------
" Buffers
"-----------------------------------------------------------------------------

set writebackup
set nobackup
set noswapfile

"-----------------------------------------------------------------------------
" Python syntax
"-----------------------------------------------------------------------------

let python_highlight_all=1
syntax on

" 启用每行超过80列的字符提示（字体变蓝并加下划线），不启用就注释掉
au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)

" PEP8 style
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
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

"按F5运行python"
map <F5> :call RunPython()<CR>
function RunPython()
    exec "w"
    if &filetype == 'python'
        exec '!time python3 %'
    elseif &filetype == 'html'
        exec "!'google chrome' % &"
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

"-----------------------------------------------------------------------------
" YCM
"-----------------------------------------------------------------------------
" youcompleteme  默认tab  s-tab 和自动补全冲突
" let g:ycm_key_list_select_completion=['<c-n>']
" let g:ycm_key_list_select_completion = ['<Down>']
" let g:ycm_key_list_previous_completion=['<c-p>']
" let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0      " 关闭加载.ycm_extra_conf.py提示
let g:ycm_complete_in_comments = 1  "在注释输入中也能补全
let g:ycm_complete_in_strings = 1   "在字符串输入中也能补全
let g:ycm_collect_identifiers_from_tags_files=1                 " 开启 YCM
" 基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_seed_identifiers_with_syntax=1   "语言关键字补全,不过python关键字都很短，所以，需要的自己打开
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_min_num_of_chars_for_completion=2                     " 从第2个键入字符就开始罗列匹配项
" 引入，可以补全系统，以及python的第三方包 针对新老版本YCM做了兼容
" old version
if !empty(glob("~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"))
    let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"
endif
" new version
if !empty(glob("~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"))
    let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
endif

"mapping
nmap <leader>gd :YcmDiags<CR>
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>           "跳转到申明处
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>            "跳转到定义处
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

" 直接触发自动补全
let g:ycm_key_invoke_completion = '<C-Space>'
" 黑名单,不启用
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'gitcommit' : 1,
      \}
