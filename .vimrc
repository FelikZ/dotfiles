let $curdir=escape(expand("<sfile>:h"), '\,')
let $vimhome=$curdir.'/.vim'
let $neoplugin=$curdir.'/.vim/bundle/neobundle.vim'
let $cwd=getcwd()

" Vim Settings {{{
set nocp
set number
set cursorline
set background=dark
set ts=4 sts=4 sw=4
set expandtab
set list
set listchars=tab:>-,extends:>,precedes:<,trail:.
set showbreak=>
set autoindent
set smartindent
set smarttab
set cindent
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
" }}}

" NeoBundle {{{
let neobundle_readme=expand($vimhome.'/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
    echo "Installing NeoBundle.."
    echo ""
    silent !mkdir -p $vimhome'/bundle'
    silent !git clone https://github.com/Shougo/neobundle.vim $vimhome'/bundle/neobundle.vim'
endif
" }}}

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

" All-lang syntax {{{
NeoBundle 'vim-scripts/SyntaxComplete'
" NeoBundle 'scrooloose/syntastic'
" }}}

" JavaScript {{{
" NeoBundle 'vim-scripts/JavaScript-Indent'
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript','coffee','coffeescript','typescript']}}
NeoBundleLazy 'pangloss/vim-javascript', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'othree/javascript-libraries-syntax.vim', {'autoload':{'filetypes':['javascript','coffee','coffeescript','typescript']}}
let g:used_javascript_libs = 'jquery,underscore,backbone,angularjs,jasmine'
" }}}

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

NeoBundle 'FelikZ/vimproc.vim', {
\ 'build' : {
\     'windows' : 'make -f make_mingw32.mak',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'unix' : 'make -f make_unix.mak',
\    },
\ }

" Unite {{{
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tsukkee/unite-tag', {'autoload': {'unite_sources': 'tag'}}
NeoBundleLazy 'Shougo/unite-outline', {'autoload': {'unite_sources': 'outline'}}
" NeoBundleLazy 'Shougo/junkfile.vim', {'autoload':{'commands':'JunkfileOpen',
" "            \ 'unite_sources':['junkfile','junkfile/new']}}
" let g:junkfile#directory=expand($curdir.'/tmp/junk')

let g:unite_enable_start_insert = 1

call unite#custom#source('file_mru,file_rec,file_rec/async,locate', 'filters',
                \ ['converter_relative_word', 'converter_relative_abbr',
                \ 'matcher_fuzzy',
                \ 'sorter_rank'])
call unite#custom#source('tag', 'filters',
                \ ['matcher_fuzzy',
                \ 'sorter_rank'])
call unite#custom#source('file_mru,file_rec,file_rec/async,grep,locate',
            \ 'ignore_pattern', '\v'.join(['(\.git\/)', '(\.DS_Store)', '(tmp\/)', '(bundle\/)', '(node_modules\/)', '('.$cwd.'\/assets\/)'], '|'))

if executable('ack')
    let g:unite_source_grep_command='ack'
    let g:unite_source_grep_default_opts='--no-group --no-color'
    let g:unite_source_grep_recursive_opt=''
    let g:unite_source_grep_search_word_highlight = 1
endif

" Tags {{{
NeoBundle 'majutsushi/tagbar'
NeoBundle 'xolox/vim-misc'
" NeoBundle 'xolox/vim-easytags'
set tags=./tags;
"let g:easytags_events = ['BufWritePost']
"let g:easytags_dynamic_files = 2
"let g:easytags_file = $curdir.'/.vimtags'
" }}}

" Colorschemes {{{
" NeoBundle 'nanotech/jellybeans.vim'
" NeoBundle 'marcelbeumer/twilight.vim'
" NeoBundle 'altercation/vim-colors-solarized'
" }}}

filetype plugin indent on
NeoBundleCheck

syntax on
colorscheme felikz_twilight

" Key bindings {{{
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
nnoremap <Space>p :<C-u>Unite -buffer-name=files -start-insert buffer file_rec/async<cr>
nnoremap <Space>t :<C-u>Unite -start-insert tag<cr>
map <leader>/  :call SyntaxAttr()<CR>

nnoremap ; :
" }}}

