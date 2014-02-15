let $curdir=escape(expand("<sfile>:h"), '\,')
let $vimhome=$curdir.'/.vim'
let $neoplugin=$curdir.'/.vim/bundle/neobundle.vim'

set nocp

if has('vim_starting')
    let &runtimepath.=','.$vimhome.','.$neoplugin
endif

let neobundledir=$curdir.'/.vim/bundle'
call neobundle#rc(neobundledir)

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'tpope/vim-sensible'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'vim-scripts/visualrepeat'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'goldfeld/vim-seek'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'terryma/vim-multiple-cursors'
"NeoBundle 'kien/ctrlp.vim'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'gorodinskiy/vim-coloresque'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'vim-scripts/JavaScript-Indent'
NeoBundle 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'gregsexton/MatchTag'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'nvie/vim-ini'
NeoBundle 'elzr/vim-json'
NeoBundle 'bling/vim-bufferline'
NeoBundle 'shawncplus/phpcomplete.vim'
NeoBundle 'vim-scripts/SyntaxAttr.vim'

" Testing
NeoBundle 'hojberg/vest'
NeoBundle 'Shougo/vesting'

" Unite
NeoBundle 'FelikZ/vimproc.vim', {
\ 'build' : {
\     'windows' : 'make -f make_mingw32.mak',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'unix' : 'make -f make_unix.mak',
\    },
\ }
NeoBundle 'Shougo/unite.vim'
let g:unite_enable_start_insert = 1
let g:unite_candidate_icon="▷"

" Tags
NeoBundle 'majutsushi/tagbar'
NeoBundle 'xolox/vim-misc'
" NeoBundle 'xolox/vim-easytags'
set tags=./tags;
"let g:easytags_events = ['BufWritePost']
"let g:easytags_dynamic_files = 2
"let g:easytags_file = $curdir.'/.vimtags'

filetype plugin indent on
NeoBundleCheck

syntax on
set number
set cursorline
colorscheme felikz_twilight
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
set noerrorbells
set novisualbell
set noeb vb t_vb=
let &dir=$curdir.'/tmp/vimswap'
set nostartofline
set nojoinspaces
set splitbelow
set splitright

colorscheme felikz_twilight

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

" Inspired by https://github.com/tpope/vim-unimpaired "
" Sets paste on and set nopaste when leaving insert mode "
" using an autocommand "
nnoremap <silent> yo  :set paste<cr>o
nnoremap <silent> yO  :set paste<cr>O

" Disables paste mode when leaving insert mode
autocmd InsertLeave *
    \ if &paste == 1 |
    \     set nopaste |
    \ endif

nnoremap <tab> >>
vnoremap <tab> >gv
nnoremap <s-tab> <<
vnoremap <s-tab> <gv
nnoremap <leader><cr> :noh<cr>

nnoremap <up> g<up>
nnoremap <down> g<down>
vnoremap <up> g<up>
vnoremap <down> g<down>

nmap <F8> :TagbarToggle<CR>
nnoremap <c-p> :<C-u>Unite -buffer-name=files -start-insert buffer file_rec/async<cr>
map <leader>/  :call SyntaxAttr()<CR>

nnoremap ; :
nnoremap ; :
