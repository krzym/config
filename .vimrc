"URL tp://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" " Description: A minimal, but feature rich, example .vimrc. If you are a
" "              newbie, basing your first .vimrc on this file is a good
" choice.
" "              If you're a more advanced user, building your own .vimrc
" based
" "              on this file is still a good idea.
"
" "------------------------------------------------------------
" " Features {{{1
" "
" " These options and commands enable some very useful features in Vim, that
" " no user should have to live without.
"
" " Set 'nocompatible' to ward off unexpected things that your distro might
" " have made, as well as sanely reset options when re-sourcing .vimrc
" set nocompatible
"
" " Attempt to determine the type of a file based on its name and possibly its
" " contents.  Use this to allow intelligent auto-indenting for each filetype,
" " and for plugins that are filetype specific.
" filetype indent plugin on
"
" " Enable syntax highlighting
syntax on
"
"
" "------------------------------------------------------------
" " Must have options {{{1
" "
" " These are highly recommended options.
"
" " One of the most important options to activate. Allows you to switch from
" an
" " unsaved buffer without saving it first. Also allows you to keep an undo
" " history for multiple files. Vim will complain if you try to quit without
" " saving, and swap files will keep you safe if your computer crashes.
" set hidden
"
" " Note that not everyone likes working this way (with the hidden option).
" " Alternatives include using tabs or split windows instead of re-using the
" same
" " window for multiple buffers, and/or:
" " set confirm
" " set autowriteall
"
" " Better command-line completion
" set wildmenu
"
" " Show partial commands in the last line of the screen
set showcmd
"
" " Highlight searches (use <C-L> to temporarily turn off highlighting; see
" the
" " mapping of <C-L> below)
set hlsearch
"
" " Modelines have historically been a source of security vulnerabilities.  As
" " such, it may be a good idea to disable them and use the securemodelines
" " script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" " set nomodeline
"
"
" "------------------------------------------------------------
" " Usability options {{{1
" "
" " These are options that users frequently set in their .vimrc. Some of them
" " change Vim's behaviour in ways which deviate from the true Vi way, but
" " which are considered to add usability. Which, if any, of these options to
" " use is very much a personal preference, but they are harmless.
"
" " Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
"
" " Allow backspacing over autoindent, line breaks and start of insert action
" set backspace=indent,eol,start
"
" " When opening a new line and no filetype-specific indenting is enabled,
" keep
" " the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
"
" " Stop certain movements from always going to the first character of a line.
" " While this behaviour deviates from that of Vi, it does what most users
" " coming from other editors would expect.
" set nostartofline
"
" " Display the cursor position on the last line of the screen or in the
" status
" " line of a window
set ruler
set cursorline
highlight  CursorLine ctermbg=Grey ctermfg=None
autocmd InsertEnter * highlight  CursorLine ctermbg=Black ctermfg=White
autocmd InsertLeave * highlight  CursorLine ctermbg=Grey ctermfg=None
set cursorcolumn
highlight  CursorColumn ctermbg=Grey ctermfg=None
autocmd InsertEnter * highlight  CursorColumn ctermbg=Black ctermfg=White
autocmd InsertLeave * highlight  CursorColumn ctermbg=Grey ctermfg=None
"
" " Always display the status line, even if only one window is displayed
set laststatus=2
"
" " Instead of failing a command because of unsaved changes, instead raise a
" " dialogue asking if you wish to save changed files.
" set confirm
"
" " Use visual bell instead of beeping when doing something wrong
" set visualbell
"
" " And reset the terminal code for the visual bell.  If visualbell is set,
" and
" " this line is also included, vim will neither flash nor beep.  If
" visualbell
" " is unset, this does nothing.
" set t_vb=
"
" " Enable use of the mouse for all modes
" set mouse=a
"
" " Set the command window height to 2 lines, to avoid many cases of having to
" " "press <Enter> to continue"
" set cmdheight=2
"
" " Display line numbers on the left
set number
"
" " Quickly time out on keycodes, but never time out on mappings
" set notimeout ttimeout ttimeoutlen=200
"
" " Use <F11> to toggle between 'paste' and 'nopaste'
" set pastetoggle=<F11>
"
set cpoptions=aABceFsmq
"             |||||||||
"             ||||||||+-- When joining lines, leave the cursor
"             |||||||      between joined lines
"             |||||||+-- When a new match is created (showmatch)
"             ||||||      pause for .5
"             ||||||+-- Set buffer options when entering the
"             |||||      buffer
"             |||||+-- :write command updates current file name
"             ||||+-- Automatically add <CR> to the last line
"             |||      when using :@r
"             |||+-- Searching continues at the end of the match
"             ||      at the cursor position
"             ||+-- A backslash has no special meaning in mappings
"             |+-- :write updates alternative file name
"             +-- :read updates alternative file name

"statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
"              | | | | |  |   |      |  |     |    |
"              | | | | |  |   |      |  |     |    + current
"              | | | | |  |   |      |  |     |       column
"              | | | | |  |   |      |  |     +-- current line
"              | | | | |  |   |      |  +-- current % into file
"              | | | | |  |   |      +-- current syntax in
"              | | | | |  |   |          square brackets
"              | | | | |  |   +-- current fileformat
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- rodified flag in square brackets
"              +-- full path to file in the buffer
"
" "------------------------------------------------------------
" " Indentation options {{{1
" "
" " Indentation settings according to personal preference.
"
" " Indentation settings for using 2 spaces instead of tabs.
" " Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
" set softtabstop=2
" set expandtab
"
" " Indentation settings for using hard tabs for indent. Display tabs as
" " two characters wide.
" "set shiftwidth=2
set tabstop=4
"
"
" "------------------------------------------------------------
" " Mappings {{{1
" "
" " Useful mappings
"
" " Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" " which is the default
" map Y y$
"
" " Map <C-L> (redraw screen) to also turn off search highlighting until the
" " next search
" nnoremap <C-L> :nohl<CR><C-L>
"
" NEO2 Keyboard Mod
"
""no s h
""no h s
""no n j
""no j n
""no r k
""no k r
""no t l
""no l t
"
"
" VUNDLE
" git clone git://github.com/gmarik/vundle.git
"
"
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
" My Bundles here:
"
" original repos on github
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
" Fav plugins
"Bundle 'fugitive.vim'
" Bundle 'snipMate'
"Bundle 'NERD_Tree'
"Bundle 'buftabs'
"Bundle 'taglist.vim'
"Bundle 'NERDCommenter'
"
" NewCompleCach Settings
let g:neocomplcache_enable_at_startup = 1
"
filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"
" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
