set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'hail2u/vim-css3-syntax' 
Plugin 'Raimondi/delimitMate'
Plugin 'pangloss/vim-javascript'
" A auto syntax checker, need additional formater installed
" It's kind of complicated to configure it
" So if you have no idea what to do with this, feel save to delete below line
Plugin 'scrooloose/syntastic'
" Indentation based movements
Plugin 'jeetsukumaran/vim-indentwise'
" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
Plugin 'klen/python-mode'
" Automatically sort python import
Plugin 'fisadev/vim-isort'
" Paint css colors with the real color
Plugin 'lilydjwg/colorizer'
if has('python')
      " YAPF formatter for Python
      Plugin 'pignacio/vim-yapf-format'
endif
" Syntax for javascript library
Plugin 'othree/javascript-libraries-syntax.vim'
" HTML close tag auto
Plugin 'docunext/closetag.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'limadm/vim-blues'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal


" Plugin setting

" Airline --------------------------------

" set status line
set laststatus=2
" enable powerline-fonts, however this will broken airline on my Mac
let g:airline_powerline_fonts = 0
" airline theme
let g:airline_theme = 'bubblegum' 

" vim-javascript ---------------------------

" set vim-javascript support DOM html and css
let javascript_enable_domhtmlcss = 1

" Syntastic ------------------------------

" show list of errors and warnings on the current file
nmap <leader>e :Errors<CR>
" check also when just opened the file
let g:syntastic_check_on_open = 1
" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 0
" custom icons (enable them if you use a patched font, and enable the previous 
" setting)
"let g:syntastic_error_symbol = '✗'
"let g:syntastic_warning_symbol = '⚠'
"let g:syntastic_style_error_symbol = '✗'
"let g:syntastic_style_warning_symbol = '⚠'

" Python-mode ------------------------------

" don't use linter, we use syntastic for that
let g:pymode_lint_on_write = 0
let g:pymode_lint_signs = 0
" don't fold python code on open
let g:pymode_folding = 0
" don't load rope by default. Change to 1 to use rope
let g:pymode_rope = 0
" open definitions on same window, and custom mappings for definitions and
" occurrences
let g:pymode_rope_goto_definition_bind = ',d'
let g:pymode_rope_goto_definition_cmd = 'e'
nmap ,D :tab split<CR>:PymodePython rope.goto()<CR>
nmap ,o :RopeFindOccurrences<CR>


" javacript-library-syntax -----------------------
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_react = 1

" vim-closetag --------------------------------------
autocmd Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim 

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set history=50                  "keep 50 lines of command line history

set ruler                       "show the cursor position all the time

set showcmd                     "display incomplete commands

set incsearch                   "do incremental searching

set nu                          "show line numbers

set hlsearch                    "highlight search terms

set ic                          "Ignore Case during searches

set autoindent                  "start new line at the same indentation level

syntax enable                   "syntax highlighting

set cmdheight=1                 "The commandbar height

set showmatch                   "Show matching bracets when text indicator is over them

set nobackup                    " do not keep backup files, it's 70's style cluttering

set noswapfile                  " do not write annoying intermediate swap files,
                                "    who did ever restore from swap files
                                "    anyway?
                                "    https://github.com/nvie/vimrc/blob/master/vimrc#L141


set ttimeoutlen=50              "Solves: there is a pause when leaving insert mode

set splitbelow                  " Horizontal splits open below current file

set splitright                  " Vertical splits open to the right of the current file

set wildmode=longest,list       " Pressing <Tab> shows command suggestions similar to pressing <Tab>
                                " in bash 

" Set cursor line and set it to such color
" set cursorline                                
" highlight CursorLine ctermbg=Gray

set background=dark
try
    colorscheme blues
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme darkblue    
endtry

" Vertical / horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" tab length exceptions on some file types
autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType htmldjango setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4

" Line highlight 設此是游標整行會標註顏色
set cursorline 
" cursorline color is set in colorscheme
" highlight CursorLine cterm=none ctermbg=23
