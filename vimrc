"========="
" PLUGINS "
"========="

"-------------------
" Activate NeoBundle
"-------------------
if has('vim_starting')
   set nocompatible               " Be iMproved
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage itself.
NeoBundleFetch "Shougo/neobundle.vim"

"-------
" Config
"-------

" Use Tim Pope's recommended, sane defaults.
NeoBundle "tpope/vim-sensible"

" Repeat support for arbitrary plugins.
NeoBundle "tpope/vim-repeat"

" Visual repeat for plugins
NeoBundle "vim-scripts/visualrepeat"

" LargeFile handling
NeoBundle "vim-scripts/LargeFile"

"------------
" Integration
"------------

" A thin wrapper around Bundler, and `bundle open` (for editing/viewing the
" contents of bundled gems).
NeoBundle "tpope/vim-bundler"

" A wrapper and integration plugin for Ruby on Rails.  It includes commands
" for navigating around a Rails project, as well as viewing documentation, running
" tests, and creating new Rails apps.
NeoBundle "tpope/vim-rails"

" Nodejs support
NeoBundle "moll/vim-node"

"---------
" Movement
"---------

" EasyMotion displays possible motions as hints, making it easier to navigate
" files.
NeoBundle "Lokaltog/vim-easymotion"

" Seek adds a two-character seek binding.
NeoBundle "goldfeld/vim-seek"

"--------
" Editing
"--------

" Surround.vim adds support for manipulating the surroundings of a text
" object,
" such as adding/removing quotes, replacing in brackets, and more.
NeoBundle "tpope/vim-surround"

" Speeddating adds support for incrementing and decrementing dates.
NeoBundle "tpope/vim-speeddating"

" Automatically close quotes, parenthesis, braces, and other delimiters.
NeoBundle "Raimondi/delimitMate"

" Automatically end block constructs in supported languages.
NeoBundle "tpope/vim-endwise"

" Commentary adds key bindings to easily comment and uncomment code.
NeoBundle "scrooloose/nerdcommenter"

" Tabular.vim adds support for automatically aligning text based on search
" queries.
NeoBundle "junegunn/vim-easy-align"

" Multiple cursors
NeoBundle "terryma/vim-multiple-cursors"

"---------------------
" Search/Substitutions
"---------------------

" A fuzzy file-finder, mru switcher, buffer finder, and more (with a nice
" collection of plugins), written in pure VimL.
" Abolish brings bracket substitutions to Vim abbreviations, searches, and
" Bundle 'kien/ctrlp.vim', {'depends': []}
NeoBundle "kien/ctrlp.vim"


" substitutions.
NeoBundle "tpope/vim-abolish"

"----------
" Utilities
"----------

" A Textmate-like 'project drawer' for Vim.
NeoBundle "scrooloose/nerdtree"

" View CSS colors.
NeoBundle "gorodinskiy/vim-coloresque"

"---------
" Keybinds
"---------

" Handy bracket-prefixed pairs of mappings that @tpope finds useful.
NeoBundle "tpope/vim-unimpaired"

"--------------------
" Completion/Snippets
"--------------------

"Preloaders for snipmate and ultra
NeoBundle "MarcWeber/vim-addon-mw-utils"
NeoBundle "tomtom/tlib_vim"
NeoBundle "garbas/vim-snipmate"

" A powerful snippet engine, with support for nested snippets.
NeoBundle "honza/vim-snippets"

" Emmet snippets
NeoBundle "mattn/emmet-vim"

"-------
" Syntax
"-------

" Syntastic adds syntax checking for most languages, and linting for the very
" popular ones.
NeoBundle "scrooloose/syntastic"


" Ruby is a language that focuses on clarity and code beauty.  With the
" extremely popular Rails (Ruby on Rails) framework, it is one of the most
" common languages used in web applications.
NeoBundle "vim-ruby/vim-ruby"

" Javascript is a language that runs in the browser (and on the server, thanks
" to Node.js).  It can be used for scripting interactive web pages, or for
" highly concurrent applications (with Node).
NeoBundle "vim-scripts/JavaScript-Indent"
NeoBundle "jelera/vim-javascript-syntax", {"autoload":{"filetypes":["javascript"]}}
NeoBundle "othree/javascript-libraries-syntax.vim"

" CoffeeScript is a language that attempts to solve some of Javascript's
" awkwardness.  The language is very Ruby-like, but compiles to Javascript.
NeoBundle "kchmck/vim-coffee-script"

" HTML5 is the newest version of the HTML markup language.  It supports new
" features such as an offline 'appcache', custom data attributes, CORS
" (Cross-Origin-Resource-Sharing), and more.
NeoBundle "othree/html5.vim"

" Highlights the matching HTML tag when the cursor
" is positioned on a tag.
NeoBundle "gregsexton/MatchTag"

" embedding code from its host language.  Sass and SCSS are a pair of
" languages that compile to CSS, adding features like variables, mixins, and selector
" nesting/inheritance/extension.  Sass has a more Haml-like syntax, while SCSS
" is more CSS-like.
NeoBundle "tpope/vim-haml"

" Mustache is a simple templating language, focusing on clarity.  Instead of
" having its own syntax, and compiling to HTML, it uses tags embedded in HTML
" to define logic and flow.
NeoBundle "juvenn/mustache.vim"

" CSS3 is the latest and greatest incarnation of CSS.  It comes with new
" features like @media queries for rules based on screen-size, and animations
" for creating fancy effects, with pure CSS.
NeoBundle "hail2u/vim-css3-syntax"

" Stylus is a minimal language that can be thought of as Slim or Jade for CSS.
" It drops all unnecessary markup from CSS, producing an extremely minimal and
" attractive language.  It supports features such as variables, selector
" inheritance, and other useful features.
NeoBundle "wavded/vim-stylus"

" LESS is a alternative language to CSS, that focuses on minimalism and
" brevity.
NeoBundle "groenewege/vim-less"

" Markdown is a simple plain-text markup language designed by John Gruber.  It
" can be compiled to (X)HTML, or viewed as plain text and still be readable.
" Markdown is widely used across the Internet to format comments, blog posts,
" and other user-created snippets of HTML.
NeoBundle "tpope/vim-markdown"

" CSV, or Comma-Seperated-Values is a spreadsheet-like data exchange format.
NeoBundle "chrisbra/csv.vim"

" INI is a simple markup language with wide support.  It supports section
" headers, but not much more.
NeoBundle "nvie/vim-ini"

" JSON (Javascript Object Notation) is a data-transfer language that was
" 'discovered' by Douglas Crockford hiding inside Javascript.  It has wide
" support between languages, and is often used in APIs.
NeoBundle "elzr/vim-json"

"-----------
" Appearance
"-----------

" Bufferline shows a list of buffers in the status bar or command line.
NeoBundle "bling/vim-bufferline"

" Solarized theme wawits no comments
NeoBundle "altercation/vim-colors-solarized"


filetype plugin indent on

NeoBundleCheck


"=================="
" GENERAL SETTINGS "
"=================="

"----------------------------------------------------------
" Enable syntax and set coloscheme with 256 terminal colors
"----------------------------------------------------------
syntax on
set background=dark
let g:solarized_termcolors=256
set t_Co=256
colorscheme solarized

"---------------------------
" Dont wrap lines by default
"---------------------------
set nowrap

"------------
" Setting utf
"------------
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8

"-----------------
" Classical search
"-----------------
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch
set gdefault

"-----------------------------
" Numberings and text paddings
"-----------------------------
set number 
set linebreak
set scrolloff=20 


"------------------------
" Hiding existing buffers
"------------------------
" If you've ever tried to type :only and had Vim refuse to hide existing
" buffers because they contain changes, you can use :set hidden to override
" this behavior. Just remember to keep the possibility of hidden modified
" buffers in mind when you're doing a :q!.
set hidden

"--------------------------------------
" Set the status line the way i like it
"--------------------------------------
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]

"------------------------
" Always show status line
"------------------------
set laststatus=2

"------------------------------
" Default to Unix line endings.
"------------------------------
set fileformats=unix,dos,mac

"-------------------------------------------------------------
" Make mapping timeouts faster, and code timeouts even faster.
"-------------------------------------------------------------
set timeoutlen=1200 " A little bit more time for macros
set ttimeoutlen=50  " Make Esc work faster 
"---------------------------------
" Change the 'c' motion's behavior
"---------------------------------
" When making a change to one line, don't redisplay the
" line, but put a '$' at the end of the changed text.
" The changed text will be overwritten when you type the
" new text.  The line is redisplayed if you type any
" command that moves the cursor from the insertion
" point.
set cpoptions=ces$

"------------------------------------------------
" Don't update the display while executing macros
"------------------------------------------------
set lazyredraw

"-----------------------------------------------------------
" Don't show the current command int the lower right corner.
"-----------------------------------------------------------
" In OSX, if this is
" set and lazyredraw is set then it's slow as molasses, so we unset this
set showcmd

"----------------------
" Show the current mode
"----------------------
set showmode

"------------------------------------
" Hide the mouse pointer while typing
"------------------------------------
set mousehide

"-----------------------------------
" Set up the gui cursor to look nice
"-----------------------------------
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

"-----------------------------------
" set the gui options the way I like
"-----------------------------------
set guioptions=acg

"------------------------------------------------------
"Extracting octal numbering from CTRL-A|CTRL-X commands
"------------------------------------------------------
set nrformats-=octal

"----------------------------------
" set the search scan to wrap lines
"----------------------------------
set wrapscan

"---------------------------------------------------------------
" Allow backspacing over indent, eol, and the start of an insert
"---------------------------------------------------------------
set backspace=2

"--------------------
"Indentational magery
"--------------------
set autoindent
set smartindent
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set shiftround

"-----------------
" Printing options
"-----------------
set printoptions=header:0,duplex:long,paper:letter

"----------------------------------------------------
"Autocomplete commands in :-mode on top of the :-line
"----------------------------------------------------
set wildmenu
set wildmode=full

"-----------------------------------------------------------------------
" When completing by tag, show the whole tag, not just the function name
"-----------------------------------------------------------------------
set showfulltag

"----------------------------------------------
" Get rid of the silly characters in separators
"----------------------------------------------
set fillchars = ""

"------------------------------------------
" Add the unnamed register to the clipboard
"------------------------------------------
if has("unix")
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

"---------------------------------------------------
" Automatically read a file that has changed on disk
"---------------------------------------------------
set autoread

"----------------------------------------------------
" Maximum column in which to search for syntax items.
"----------------------------------------------------
set synmaxcol=800

"-------------------------
" disable sounds and noise
"-------------------------
set noerrorbells
set novisualbell
set noeb vb t_vb=

"------------------------
" Show special characters
"------------------------
set list
set listchars=tab:→\ ,trail:·,extends:>,precedes:<,nbsp:⋅
set showbreak=↪

"-----------------------
" backups and swap files
"-----------------------
set nobackup
set nowritebackup
set noswapfile

"----------
" Diff opts
"----------
" Display filler
set diffopt=filler
" Open diff in horizontal buffer
set diffopt+=horizontal
" Ignore changes in whitespaces characters
set diffopt+=iwhite

"-----------------------------------------------------
" The cursor should stay where you leave it,
" instead of moving to the first non blank of the line
"-----------------------------------------------------
set nostartofline

"---------------------------------------------------------------------------
" Remove all useless messages like intro screen and use abbreviation like RO
" instead readonly and + instead modified
"---------------------------------------------------------------------------
set shortmess=atI

"-----------------------------------
" Indicates fast terminal connection
"-----------------------------------
set ttyfast

"----------------------------------------------------
" No double spaces after . ! and ? when joining lines
"----------------------------------------------------
set nojoinspaces

"--------------------------------
" split below and vsplit to right
"--------------------------------
set splitbelow
set splitright


"=========="
" MAPPINGS "
"=========="

"------------------------------------------------------
" Declaring the global and local leader key to be comma
"------------------------------------------------------
let mapleader=','
let maplocalleader='\\'

"-------------------------
" Change ^ to H and $ to L
"-------------------------
nnoremap H ^
vnoremap H ^
nnoremap L $
vnoremap L $

"--------------------
" Experiment with esc
"--------------------
inoremap <esc> <nop>
inoremap jk <esc>

"--------------------------------------
" Remove the remaining highlight search
"--------------------------------------
nnoremap <leader><cr> :noh<cr>

"--------------------------------
" Common replacements for yanking
"--------------------------------
nnoremap Y y$

"---------------------------------------------
" Remapping arrow keys to understand wrappings
"---------------------------------------------
nnoremap <silent> <Up> gk
inoremap <silent> <Up> <C-o>gk
nnoremap <silent> <Down> gj
inoremap <silent> <Down> <C-o>gj
nnoremap <silent> <home> g<home>
inoremap <silent> <home> <C-o>g<home>

"-------------------------------------------
" Remapping dir keys to understand wrappings
"-------------------------------------------
nnoremap <silent> j gj
vnoremap <silent> j gj
nnoremap <silent> k gk
vnoremap <silent> k gk

"------------------------------------------
" Reselect previous selection and indent it
"------------------------------------------
vnoremap < <gv
vnoremap > >gv

"-----------------------
" Access vim config file
"-----------------------
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

"-------------------------------------------------
" Keep search matches and jumpings in the middle of the window.
"-------------------------------------------------
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

"----------------
" Don't move on *
"----------------
" I'd use a function for this but Vim clobbers the last search when you're in
" a function so fuck it, practicality beats purity.
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*<c-o>:call winrestview(stay_star_view)<cr>

"-----------------
" Jumping to tags.
"-----------------
" Basically, <c-]> jumps to tags (like normal) and <c-\> opens the tag in a new
" split instead.
"
" Both of them will align the destination line to the upper middle part of the
" screen.  Both will pulse the cursor line so you can see where the hell you
" are.  <c-\> will also fold everything in the buffer and then unfold just
" enough for you to see the destination line.
function! JumpToTag()
    execute "normal! \<c-]>mzzvzz15\<c-e>"
    execute "keepjumps normal! `z"
    Pulse
endfunction
function! JumpToTagInSplit()
    execute "normal! \<c-w>v\<c-]>mzzMzvzz15\<c-e>"
    execute "keepjumps normal! `z"
    Pulse
endfunction
nnoremap <c-]> :silent! call JumpToTag()<cr>
nnoremap <c-\> :silent! call JumpToTagInSplit()<cr>

"------------------------------------
" Split line (sister to [J]oin lines)
"------------------------------------
nnoremap <leader>J i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

"-------------
" Panic Button
"-------------
nnoremap <f9> mzggg?G`z

"==========================="
" AUTOCOMMANDS AND FUNCTIONS"
"==========================="

"--------------
" Abbreviations
"--------------
function! EatChar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunction

function! MakeSpacelessIabbrev(from, to)
    execute "iabbrev <silent> ".a:from." ".a:to."<C-R>=EatChar('\\s')<CR>"
endfunction
function! MakeSpacelessBufferIabbrev(from, to)
    execute "iabbrev <silent> <buffer> ".a:from." ".a:to."<C-R>=EatChar('\\s')<CR>"
endfunction

call MakeSpacelessIabbrev('bb/',  'http://bitbucket.org/')
call MakeSpacelessIabbrev('bbk/', 'http://bitbucket.org/kapral18/')
call MakeSpacelessIabbrev('gh/',  'http://github.com/')
call MakeSpacelessIabbrev('ghk/', 'http://github.com/kapral18/')

iabbrev mj@ mjohn.favourite@gmail.com
iabbrev vrcf `~/.vimrc` file

"-----------------
" CSS AUTOCOMMANDS
"-----------------
aug ft_css
    au!
    au Filetype css setlocal foldmethod=marker
    au Filetype css setlocal foldmarker={,}
    au Filetype css setlocal iskeyword+=-
    au BufNewFile,BufRead *.css nnoremap <buffer> <localleader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>
    au BufNewFile,BufRead *.css inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
aug END

"------------------
" HTML AUTOCOMMANDS
"------------------
aug ft_html
    au!
    au FileType html setlocal foldmethod=manual
    " Use <localleader>f to fold the current tag.
    au FileType html nnoremap <buffer> <localleader>f Vatzf
    " Indent tag
    au FileType html nnoremap <buffer> <localleader>= Vat=
aug END

"------------------
" PHTML AUTCOMMANDS
"------------------
aug HTML
    au!
    au BufRead,BufNewFile *.phtml  set filetype=html
aug END

"-----------------
" XML AUTOCOMMANDS
"-----------------
augroup ft_xml
    au!

    au FileType xml setlocal foldmethod=manual

    " Use <localleader>f to fold the current tag.
    au FileType xml nnoremap <buffer> <localleader>f Vatzf

    " Indent tag
    au FileType xml nnoremap <buffer> <localleader>= Vat=
augroup END

"------------------------
" JAVASCRIPT AUTOCOMMANDS
"------------------------
aug ft_javascript
    au!
    au FileType javascript setlocal shiftwidth=4 softtabstop=4 tabstop=4
    au FileType javascript setlocal foldmethod=marker
    au FileType javascript setlocal foldmarker={,}
    au FileType javascript call MakeSpacelessBufferIabbrev('clog', 'console.log();<left><left>')
aug END

"----------------------
" MARKDOWN AUTOCOMMANDS
"----------------------
augroup ft_markdown
    au!
    au BufNewFile,BufRead *.m*down setlocal filetype=markdown foldlevel=1 foldmethod=manual
    " Use <localleader>1/2/3 to add headings.
    au Filetype markdown nnoremap <buffer> <localleader>1 yypVr=:redraw<cr>
    au Filetype markdown nnoremap <buffer> <localleader>2 yypVr-:redraw<cr>
    au Filetype markdown nnoremap <buffer> <localleader>3 mzI###<space><esc>`zllll
    au Filetype markdown nnoremap <buffer> <localleader>4 mzI####<space><esc>`zlllll
augroup END

"-----------------
" VIM AUTOCOMMANDS
"-----------------
aug ft_vim
    au!
    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
    au BufWritePost $MYVIMRC source $MYVIMRC
aug END

"------------------------
" POSTGRESQL AUTOCOMMANDS
"------------------------
augroup ft_postgres
    au!
    au BufNewFile,BufRead *.sql set filetype=pgsql
    au FileType pgsql set foldmethod=indent
    au FileType pgsql set softtabstop=2 shiftwidth=2
    au FileType pgsql setlocal commentstring=--\ %s comments=:--
augroup END

"----------------------
" QUICKFIX AUTOCOMMANDS
"----------------------
augroup ft_quickfix
    au!
    au Filetype qf setlocal colorcolumn=0 nolist nocursorline nowrap tw=0
augroup END

"------------------
" RUBY AUTOCOMMANDS
"------------------
augroup ft_ruby
    au!
    au Filetype ruby setlocal foldmethod=syntax
    au BufRead,BufNewFile Capfile setlocal filetype=ruby
augroup END

"-----------------------------------------
" Resize splits when the window is resized
"-----------------------------------------
au VimResized * :wincmd =

"-------------------------------------------
" Restore the cursor position from last time
"-------------------------------------------
aug line_return
    au!
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif
aug END

"---------------------------
" EN/RU switching&indication
"---------------------------
set keymap=russian-jcukenwin    " C-^ lang layout switch
set iminsert=0                  " default input layout - english
set imsearch=0                  " default search layout - english

" English layout active windows status line is DarkBlue
" English layout active windows status line is DarkRed
function! MyKeyMapHighlight()
  if &iminsert == 0
    hi StatusLine ctermfg=DarkBlue guifg=DarkBlue
  else
    hi StatusLine ctermfg=DarkRed guifg=DarkRed
  endif
endfunction
" call our func on startup and redraw colors
call MyKeyMapHighlight()
" update layout indication on window change
au WinEnter * :call MyKeyMapHighlight()

" ru/en lang switch ^f (Ctrl + F)
cnoremap <silent> <C-F> <C-^>
inoremap <silent> <C-F> <C-^>X<Esc>:call MyKeyMapHighlight()<CR>a<C-H>
nnoremap <silent> <C-F> a<C-^><Esc>:call MyKeyMapHighlight()<CR>
vnoremap <silent> <C-F> <Esc>a<C-^><Esc>:call MyKeyMapHighlight()<CR>gv

"---------------------------------
" OPEN URL UNDER CURSOR IN BROWSER
"---------------------------------
function! OpenURL(url)
  if has("win32")
    exe "!start cmd /cstart /b ".a:url.""
  elseif $DISPLAY !~ '^\w'
    exe "silent !sensible-browser \"".a:url."\""
  else
    exe "silent !sensible-browser -T \"".a:url."\""
  endif
  redraw!
endfunction
command! -nargs=1 OpenURL :call OpenURL(<q-args>)
" open URL under cursor in browser
nnoremap gb :OpenURL <cfile><CR>
nnoremap gG :OpenURL http://www.google.com/search?q=<cword><CR>



"================"
" PLUGIN SETTINGS"
"================"

"-----------------------
" Toggle NerdTree Plugin
"-----------------------
nnoremap <leader>n :NERDTreeToggle<CR>
au bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"------------------------------
" Easy align plugin  invocation
"------------------------------
vnoremap <Enter> <Plug>(EasyAlign)
vnoremap <Leader>a <Plug>(EasyAlign)

"---------------
" Tag bar
"---------------
nnoremap <F8> :TagbarToggle<br>

"----------
" Syntastic
"----------
" Enable autochecks
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1

" open quicfix window with all error found
nnoremap <silent> <leader>ll :lopen<cr>

"------------
" DelimitMate
"------------
" Delimitmate place cursor correctly n multiline objects e.g.
" if you press enter in {} cursor still be
" in the middle line instead of the last
let delimitMate_expand_cr = 1

" Delimitmate place cursor correctly in singleline pairs e.g.
" if x - cursor if you press space in {x} result will be { x } instead of { x}
let delimitMate_expand_space = 1
