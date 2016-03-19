" Init {{{
let $curdir=escape(expand("<sfile>:h"), '\,')
let $vimhome=$curdir.'/.vim'
let $neoplugin=$curdir.'/.vim/bundle/neobundle.vim'
let $cwd=getcwd()
" }}}

" Vim Settings {{{
set t_Co=256
set t_ut=
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
set nocp
set number
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
set fileformats=unix
set ignorecase
set smartcase
set hlsearch
set incsearch
set gdefault
set scrolloff=5
set laststatus=2
set statusline=%f\ %m\ %r\ Line:%l/%L\ Col:%v
set timeoutlen=1200
set ttimeoutlen=120
set hidden
set wildmenu
set wildmode=full
set noerrorbells
set novisualbell
set noeb vb t_vb=
let &dir=$curdir.'/tmp/vimswap'
set nostartofline
set nojoinspaces
set splitbelow
set splitright
set noeol
set foldmethod=marker
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

" Performance
set regexpengine=2
set ttyfast
set ttyscroll=3
set lazyredraw
set nocursorcolumn
set nocursorline
set norelativenumber
syntax sync minlines=256
set synmaxcol=300
set noshowmatch

" let loaded_matchparen = 1
let g:matchparen_timeout = 10
let g:matchparen_insert_timeout = 10
" }}}

" NeoBundle {{{
let neobundle_readme=expand($vimhome.'/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
    echo "Installing NeoBundle.."
    echo ""
    silent !mkdir -p $vimhome'/bundle'
    silent !git clone https://github.com/Shougo/neobundle.vim $vimhome'/bundle/neobundle.vim'
endif

if has('vim_starting')
    let &runtimepath.=','.$vimhome.','.$neoplugin
    " autocmd BufEnter * let &path=expand('%:p:h')
endif

let neobundledir=$curdir.'/.vim/bundle'
call neobundle#begin(neobundledir)

NeoBundleFetch 'Shougo/neobundle.vim'
" }}}

" Libraries {{{
NeoBundle 'FelikZ/vimproc.vim', {
\ 'build' : {
\     'windows' : 'make -f make_mingw32.mak',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'unix' : 'make -f make_unix.mak',
\    },
\ }
" }}}

" General {{{
NeoBundle 'vim-scripts/visualrepeat'
NeoBundle 'vim-scripts/tComment'

" This should be before vim-abolish because of *:S* synonym duplicate
NeoBundle 'othree/eregex.vim'
let g:eregex_forward_delim = '<leader>/'
let g:eregex_backward_delim = '\?'

NeoBundle 'tpope/vim-sensible'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-abolish'

NeoBundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_upper = 1
hi link EasyMotionMoveHL Search

" viv
NeoBundle 'gorkunov/smartpairs.vim'
let g:smartpairs_key = 'm'
let g:smartpairs_nextpairs_key = 'm'
let g:smartpairs_nextpairs_key_i = '<leader>m'
let g:smartpairs_nextpairs_key_a = '<leader>M'

NeoBundle 'FooSoft/vim-argwrap'
nnoremap <silent> <leader>w :ArgWrap<CR>
let g:argwrap_padded_braces = '{'

NeoBundle 'tpope/vim-surround'
vmap <leader>"   <Plug>VSurround"
vmap <leader>'   <Plug>VSurround'

NeoBundle 'Raimondi/delimitMate'
let g:delimitMate_expand_cr = 1
" NeoComplete compatibility
imap <expr> <CR> pumvisible() ? neocomplete#close_popup() : '<Plug>delimitMateCR'

NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'joedicastro/vim-multiple-cursors'
" }}}

" Text objects {{{
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-line'
" }}}

" Matching / Searching {{{
NeoBundle 'mileszs/ack.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'FelikZ/ctrlp-py-matcher'
" NeoBundle 'JazzCore/ctrlp-cmatcher', {
" \ 'build' : {
" \     'windows' : './install_windows.bat',
" \     'cygwin' : './install_linux.sh',
" \     'mac' : './install_linux.sh',
" \     'unix' : './install_linux.sh',
" \    },
" \ }
" NeoBundle 'Yggdroot/LeaderF'
" }}}
nnoremap <Leader>fu :CtrlPFunky<Cr>
let g:ctrlp_funky_multi_buffers = 1
NeoBundle 'tacahiroy/ctrlp-funky'

NeoBundle 'FelikZ/vimpy', { 'rev': 'develop'}
" NeoBundle 'LimpidTech/vimpy_examples'

" NeoBundle 'clones/vim-fuzzyfinder'
" NeoBundle 'vim-scripts/L9'
" NeoBundle 'scrooloose/nerdtree'

" All-lang syntax {{{
NeoBundle 'vim-scripts/SyntaxComplete'
NeoBundle 'vim-scripts/SyntaxAttr.vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'gregsexton/MatchTag'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'nvie/vim-ini'
NeoBundle 'elzr/vim-json'
NeoBundle 'shawncplus/phpcomplete.vim'
NeoBundle 'joonty/vdebug'
let g:vdebug_keymap = {
\    "run" : "<F5>",
\    "run_to_cursor" : "<F7>",
\    "step_over" : "<F9>",
\    "step_into" : "<F10>",
\    "step_out" : "<F8>",
\    "close" : "<F6>",
\    "detach" : "<F11>",
\    "set_breakpoint" : "<F4>",
\    "get_context" : "<F3>",
\    "eval_under_cursor" : "<F12>",
\    "eval_visual" : "<Leader>e",
\}
let g:vdebug_options = {}
let g:vdebug_options['path_maps'] = {"/var/www/html": $cwd}

NeoBundle 'elentok/plaintasks.vim'
NeoBundle 'ekalinin/Dockerfile.vim'
NeoBundle 'vim-scripts/nginx.vim'
NeoBundle 'apeschel/vim-syntax-apache'
NeoBundle 'jeroenbourgois/vim-actionscript'
NeoBundle 'markcornick/vim-vagrant'
NeoBundle 'stephpy/vim-yaml'
" NeoBundle 'vim-scripts/dbext.vim'
" NeoBundle 'scrooloose/syntastic'
" NeoBundle 'yazug/vim-taglist-plus'
au BufRead,BufNewFile *.twig,*.rt,*.ejs setfiletype html
au FileType gitcommit set tw=72
NeoBundle 'bogado/file-line'
" }}}

" JavaScript {{{
" NeoBundle 'vim-scripts/JavaScript-Indent'
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript','coffee','coffeescript','typescript']}}
NeoBundleLazy 'pangloss/vim-javascript', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'mxw/vim-jsx', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'othree/javascript-libraries-syntax.vim', {'autoload':{'filetypes':['javascript','coffee','coffeescript','typescript']}}
let g:used_javascript_libs = 'jquery,underscore,backbone,angularjs,jasmine'

" NeoBundleLazy 'Shutnik/jshint2.vim', {'autoload':{'filetypes':['javascript']}}
let jshint2_save = 1
let jshint2_height = 3
let jshint2_read = 0

" "Node.js
" NeoBundle 'guileen/vim-node-dict'
" NeoBundle 'myhere/vim-nodejs-complete'
" NeoBundle 'ahayman/vim-nodejs-complete
" }}}

" xolox stuff {{{
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-session'
let g:session_autosave_periodic = 2
let g:session_directory = $curdir.'/.vim/sessions'
let g:session_autosave = 'no'
let g:session_autoload = 'no'
" }}}

" Completion {{{
" NeoBundle 'xolox/vim-easytags'
set tags=./tags,./TAGS,tags;~,TAGS;~
"let g:easytags_events = ['BufWritePost']
"let g:easytags_dynamic_files = 2
"let g:easytags_file = $curdir.'/.vimtags'

NeoBundle 'Shougo/neocomplete.vim'

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_refresh_always = 1

let g:neocomplete#max_list = 30
let g:neocomplete#min_keyword_length = 3
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#data_directory = $curdir.'/tmp/neocomplete'

let g:neocomplete#enable_auto_select = 0
let g:neocomplete#skip_auto_completion_time = '0.2'

" let g:neocomplete#sources._ = ['vim', 'omni', 'include', 'buffer', 'file/include']

" let g:neocomplete#sources#tags#cache_limit_size = 200327685

NeoBundle 'honza/vim-snippets'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory=$curdir.'/.vim/bundle/vim-snippets/snippets'


" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" autocmd FileType sql setlocal omnifunc=sqlcomplete#Complete
let g:omni_sql_no_default_maps = 1
let g:ftplugin_sql_omni_key = '<Plug>DisableSqlOmni'
" }}}

" Airline {{{
" NeoBundle 'bling/vim-bufferline'
" NeoBundle 'bling/vim-airline', '727192ad6a4421e19294faf1c58ca75a624fda30'
NeoBundle 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 0
" serene, wombat
let g:airline_theme='solarized'
" }}}

" Testing {{{
" NeoBundle 'hojberg/vest'
" NeoBundle 'Shougo/vesting'
NeoBundle 'vim-scripts/Decho'
" }}}

" Unite {{{
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tsukkee/unite-tag', {'autoload': {'unite_sources': 'tag'}}
NeoBundleLazy 'Shougo/unite-outline', {'autoload': {'unite_sources': 'outline'}}
" NeoBundleLazy 'Shougo/junkfile.vim', {'autoload':{'commands':'JunkfileOpen',
" "            \ 'unite_sources':['junkfile','junkfile/new']}}
" let g:junkfile#directory=expand($curdir.'/tmp/junk')

" let g:unite_enable_start_insert = 1
" let g:unite_data_directory = $curdir.'/tmp/unite'

" call unite#custom#source('file_mru,file_rec,file_rec/async,locate', 'filters',
"                 \ ['converter_relative_word', 'converter_relative_abbr',
"                 \ 'matcher_fuzzy',
"                 \ 'sorter_rank'])
" call unite#custom#source('file_mru,file_rec,file_rec/async,grepocate',
"                 \ 'max_candidates', 0)
" call unite#custom#source('tag', 'filters',
"                 \ ['matcher_fuzzy',
"                 \ 'sorter_rank'])
" call unite#custom#source('file_mru,file_rec,file_rec/async,grep,locate',
"             \ 'ignore_pattern', '\v'.join(['(\.git\/)', '(\.DS_Store)', '(tmp\/)', '(bundle\/)', '(node_modules\/)', '('.$cwd.'\/assets\/)'], '|'))
" call unite#filters#matcher_default#use(['matcher_glob'])
" call unite#filters#sorter_default#use(['sorter_rank'])
" call unite#custom#profile('files', 'filters', 'sorter_rank')
"
" if executable('ag')
"     let g:unite_source_grep_command = 'ag'
"     let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
"     let g:unite_source_grep_recursive_opt = ''
"     " let g:unite_source_rec_async_command = 'ag --nocolor --nogroup -g ""'
"     " let g:unite_source_file_rec_async_command = 'ag --nocolor --nogroup -g ""'
"     let g:unite_source_rec_async_command = 'ag -l -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
"     let g:unite_source_file_rec_async_command = 'ag -l -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
" elseif executable('ack')
"     let g:unite_source_grep_command='ack'
"     let g:unite_source_grep_default_opts='--column --no-color --nogroup --with-filename'
"     let g:unite_source_grep_recursive_opt=''
"     let g:unite_source_grep_search_word_highlight = 1
" endif
"
" let g:unite_source_file_rec_max_cache_files=0
" let g:unite_source_rec_max_cache_files=0
" }}}

" Projects and indexing {{{
" NeoBundle 'tbknl/vimproject'
NeoBundle 'vim-scripts/DfrankUtil'
NeoBundle 'FelikZ/vimprj'
let g:indexer_ctagsWriteFilelist = 1
let g:indexer_recurseUpCount = 2
let g:indexer_debugLogLevel = 0
let g:indexer_enableWhenProjectDirFound = 0

let vimExecPath = $curdir.'/bin/vim'

if filereadable(vimExecPath)
    let g:indexer_vimExecutable = vimExecPath
endif
NeoBundle 'phreaknerd/vim-indexer'
" }}}

" Visual {{{
NeoBundle 'vim-scripts/ScreenShot'
let ScreenShot = {'Icon':0, 'Credits':0}
" }}}

" Colorschemes {{{
" NeoBundle 'nanotech/jellybeans.vim'
" NeoBundle 'marcelbeumer/twilight.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-airline/vim-airline-themes'
" NeoBundle 'goatslacker/mango.vim'
hi link EasyMotionTarget Type
hi link EasyMotionShade  Comment
hi link EasyMotionTarget2First Statement
hi link EasyMotionTarget2Second Statement
hi link EasyMotionIncSearch PreProc
hi link EasyMotionIncCursor Normal
hi link EasyMotionMoveHL Constant
" }}}

" File system {{{
NeoBundle 'danro/rename.vim'
let g:PreserveNoEOL = 1
NeoBundle 'vim-scripts/PreserveNoEOL'
" }}}

call neobundle#end()

filetype plugin indent on
NeoBundleCheck

syntax on
" colorscheme felikz_twilight
" let g:solarized_contrast="high"
" let g:solarized_termtrans=0
" let g:solarized_termcolors=256
let g:solarized_visibility="normal"
colorscheme solarized

" Key bindings {{{
nnoremap H ^
vnoremap H ^
nnoremap L $
vnoremap L $
" inoremap jk <esc>

" Inspired by https://github.com/tpope/vim-unimpaired "
" Sets paste on and set nopaste when leaving insert mode "
" using an autocommand "
nnoremap <silent> yo  :set paste<cr>o
nnoremap <silent> yO  :set paste<cr>O

" Copy current file path to buffer
nnoremap <silent> <leader>pc :let @0=expand('%')<cr>
nnoremap <silent> <leader>pp :let @0=expand('%')<cr>"0P
nnoremap <silent> <leader>pC :let @0=expand('%:p')<cr>
nnoremap <silent> <leader>pP :let @0=expand('%:p')<cr>"0P

" Copy current file name (tail of path) to buffer
nnoremap <silent> <leader>pt :let @0=expand('%:t')<cr>
nnoremap <silent> <leader>pT :let @0=expand('%:t')<cr>"0P

" Disables paste mode when leaving insert mode
autocmd InsertLeave *
    \ if &paste == 1 |
    \     set nopaste |
    \ endif

" Disable tmp files for crontab
autocmd filetype crontab setlocal nobackup nowritebackup

" Auto reload files
autocmd FocusGained,BufEnter * :silent! !

" Disables new EOL at the end of file
" autocmd BufWritePre * setl binary noendofline
" autocmd BufWritePost * setl nobinary

nnoremap <tab> >>
vnoremap <tab> >gv
nnoremap <s-tab> <<
vnoremap <s-tab> <gv
imap <S-Tab> <Esc><<Hi

nnoremap <leader><cr> :noh<cr>

" Move throught wrap lines
nnoremap <up> g<up>
nnoremap <down> g<down>
vnoremap <up> g<up>
vnoremap <down> g<down>

" Unite bindings
" nnoremap <Space>p :<C-u>Unite -buffer-name=files -start-insert buffer file_rec/async:!<cr>
" nnoremap <Space>t :<C-u>Unite -start-insert tag<cr>
" nnoremap <Space>/ :Unite grep:.<cr>

" CtrlP
let g:ctrlp_map = '<Space>p'
let g:ctrlp_cmd = 'CtrlPCurWD'
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_open_multiple_files = 'ri'

" let g:ctrlp_by_filename = 1
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:10,results:20'
let g:ctrlp_lazy_update = 350
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $curdir.'/tmp/ctrlp'
let g:ctrlp_max_files = 0
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
endif

" PyMatcher for CtrlP
if !has('python') && !has('python3')
    echo 'In order to use pymatcher plugin, you need +python compiled vim'
else
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif

" FuzzFinder
" nnoremap <Space>p :FufFile<cr>

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Snippets bindings {{
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif
" }}

" Leader bindings {{{
" Debug
nnoremap <silent> <leader>DD :exe ":profile start profile.log"<cr>:exe ":profile func *"<cr>:exe ":profile file *"<cr>
nnoremap <silent> <leader>DP :exe ":profile pause"<cr>
nnoremap <silent> <leader>DC :exe ":profile continue"<cr>
nnoremap <silent> <leader>DQ :exe ":profile pause"<cr>:noautocmd qall!<cr>

" Show color of current symbol
" map <leader>'  :call SyntaxAttr()<CR>

" Close prev/next buffer
nmap <silent> [c :bp\|bd #<CR>
nmap <silent> ]c :bn\|bd #<CR>
" }}}

" Start interactive EasyAlign in visual mode
vmap <Enter> <Plug>(EasyAlign)

autocmd FileType plaintasks nnoremap <buffer> <Enter> :call ToggleComplete()<cr>
autocmd FileType plaintasks vnoremap <buffer> <Enter> :call ToggleComplete()<cr>
autocmd FileType plaintasks nnoremap <buffer> + :call NewTask()<cr>
autocmd FileType plaintasks vnoremap <buffer> + :call NewTask()<cr>
autocmd FileType plaintasks nnoremap <buffer> - :call ToggleCancel()<cr>
autocmd FileType plaintasks vnoremap <buffer> - :call ToggleCancel()<cr>

" EN/RU switching&indication " {{{ -------------------------------------------
set keymap=russian-jcukenwin    " C-^ lang layout switch
set iminsert=0                  " default input layout - english
set imsearch=0                  " default search layout - english
"
" English layout active windows status line is DarkBlue
" English layout active windows status line is DarkRed
" function! MyKeyMapHighlight()
"   if &iminsert == 0
"     hi StatusLine ctermfg=DarkBlue guifg=DarkBlue
"   else
"     hi StatusLine ctermfg=DarkRed guifg=DarkRed
"   endif
" endfunction
" " call our func on startup and redraw colors
" call MyKeyMapHighlight()
" " update layout indication on window change
" au WinEnter * :call MyKeyMapHighlight()

" ru/en lang switch ^f (Ctrl + F)
" cnoremap <silent> <C-F> <C-^>
" inoremap <silent> <C-F> <C-^>X<Esc>:call MyKeyMapHighlight()<CR>a<C-H>
" nnoremap <silent> <C-F> a<C-^><Esc>:call MyKeyMapHighlight()<CR>
" vnoremap <silent> <C-F> <Esc>a<C-^><Esc>:call MyKeyMapHighlight()<CR>gv
" }}}

" Easy-motion " {{{ --------------------------------------
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineforward)

nmap S <Plug>(easymotion-s)
nmap s <Plug>(easymotion-s2)
nmap T <Plug>(easymotion-t)
nmap t <Plug>(easymotion-t2)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

map <expr> ; EasyMotion#is_active() ? '<Plug>(easymotion-next)' : ';'
map <expr> , EasyMotion#is_active() ? '<Plug>(easymotion-prev)' : ','
"}}}

" Fn keys {{{
nmap <F2> :w<cr>
imap <F2> <Esc>:w<cr>a
" }}}
" }}}