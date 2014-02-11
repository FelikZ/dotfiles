let curdir=expand("<sfile>:h")

if has('vim_starting')
    set nocp
    let &runtimepath.=curdir.'/.vim,'.curdir.'/.vim/bundle/neobundle.vim/'
endif

let neobundledir=curdir.'/.vim/bundle/'
call neobundle#rc(neobundledir)

NeoBundleFetch "Shougo/neobundle.vim"

NeoBundle "tpope/vim-sensible"
NeoBundle "tpope/vim-repeat"
NeoBundle "vim-scripts/visualrepeat"
NeoBundle "Lokaltog/vim-easymotion"
NeoBundle "goldfeld/vim-seek"
NeoBundle "tpope/vim-surround"
NeoBundle "Raimondi/delimitMate"
NeoBundle "tpope/vim-endwise"
NeoBundle "junegunn/vim-easy-align"
NeoBundle "terryma/vim-multiple-cursors"
NeoBundle "kien/ctrlp.vim"
NeoBundle "mileszs/ack.vim"
NeoBundle "tpope/vim-abolish"
NeoBundle "scrooloose/nerdtree"
NeoBundle "gorodinskiy/vim-coloresque"
NeoBundle "tpope/vim-unimpaired"
NeoBundle "vim-scripts/JavaScript-Indent"
NeoBundle "jelera/vim-javascript-syntax", {"autoload":{"filetypes":["javascript"]}}
NeoBundle "othree/javascript-libraries-syntax.vim"
NeoBundle "othree/html5.vim"
NeoBundle "gregsexton/MatchTag"
NeoBundle "hail2u/vim-css3-syntax"
NeoBundle "nvie/vim-ini"
NeoBundle "elzr/vim-json"
NeoBundle "bling/vim-bufferline"
NeoBundle "shawncplus/phpcomplete.vim"

filetype plugin indent on
NeoBundleCheck

syntax on
set number
color desert
set background=dark
set ts=4 sts=4 sw=4
set expandtab
set list
set listchars=tab:>-,extends:>,precedes:<,trail:.
set showbreak=>
set autoindent
set smartindent
set smarttab
set shiftround
set backspace=2
set showcmd
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileformats=unix,dos,mac
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch
set gdefault
set scrolloff=5
set laststatus=2
set statusline=%f\ %m\ %r\ Line:%l/%L\ Col:%v
set timeoutlen=1200
set ttimeoutlen=120
set hidden
set wildmenu
set wildmode=full
set synmaxcol=800
if has("unix")
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif
set noerrorbells
set novisualbell
set noeb vb t_vb=
set dir-=.
set nostartofline
set nojoinspaces
set splitbelow
set splitright
nnoremap H ^
vnoremap H ^
nnoremap L $
vnoremap L $
" inoremap jk <esc>

function! Auto_complete_string()
    if pumvisible()
        return "\<C-n>"
    else
        return "\<C-x>\<C-o>\<C-r>=Auto_complete_opened()\<CR>"
    end
endfunction

function! Auto_complete_opened()
    if pumvisible()
        return "\<Down>"
    end
    return ""
endfunction

inoremap <expr> <Nul> Auto_complete_string()
inoremap <expr> <C-Space> Auto_complete_string()

nnoremap <tab> >>
vnoremap <tab> >gv
nnoremap <s-tab> <<
vnoremap <s-tab> <gv
nnoremap <leader><cr> :noh<cr>

nnoremap <up> g<up>
nnoremap <down> g<down>
vnoremap <up> g<up>
vnoremap <down> g<down>
