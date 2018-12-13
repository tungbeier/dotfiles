"            _
"     __   _(_)_ __ ___  _ __ ___
"     \ \ / / | '_ ` _ \| '__/ __|
"      \ V /| | | | | | | | | (__
"       \_/ |_|_| |_| |_|_|  \___|
"
" =============================================================================
" => Vim Plug
" =============================================================================
call plug#begin('~/.vim/plugged')

Plug 'bronson/vim-trailing-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'valloric/youcompleteme'
Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go'
Plug 'udalov/kotlin-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" =============================================================================
" =>Plugins configuration
" =============================================================================
" Disable language support
" let g:polyglot_disabled = ['css']

" Leader
let mapleader = ","

" SimpylFold
" let g:SimpylFold_docstring_preview=1

" Vim-Go
let g:go_fold_enable = []
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1

" You Complete Me
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" Airline
let g:airline_powerline_fonts=1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
" =============================================================================
" =>General
"" =============================================================================
" Set to auto read when a file is changed from the outside
set autoread

" Set how many lines of history Vim has to remember
set history=750

" =============================================================================
" => Vim user interface
" =============================================================================
" Turn on wildmenu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Show current position
set ruler

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Makes search act like search in modern browers
set incsearch

" Highlight search results
set hlsearch

" Don't redraw while executing macros
set lazyredraw

" Turn on magic for regex
set magic

" Show matching brackets
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No errors sound
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" =============================================================================
" => Colors and Fonts
" =============================================================================
" Enable syntax highlighting
syntax enable " allow customizing

"let base16colorspace=256
"colorscheme base16-default-dark

" Set encoding
set encoding=utf-8

" Use unix as the standard file type
set ffs=unix,dos,mac

" =============================================================================
" => Backups
" =============================================================================
" Turn off backup
set nobackup
set nowritebackup
set noswapfile

" =============================================================================
" => Text, tab and indent related
" =============================================================================
" Use space instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

au BufNewFile,BufRead *.c, *.cpp, *.h, *.css, *.html, *.sql, *.js
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2


set lbr " Linebreak
set tw=140 " text width

set ai   " auto indent
set si   " smart indent
set wrap " wrap lines

set fileformat=unix

set list
set listchars=tab:▸\ ,eol:¬

" =============================================================================
" => Moving around, tabs, windows and buffers
" =============================================================================
" move between windows with ctrl-<vim move commands>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nmap <leader>n :NERDTreeToggle<cr>

" =============================================================================
" => Disabling arrow keys
" =============================================================================
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" =============================================================================
" => Status line
" =============================================================================
" Always show the status line
set laststatus=2

" =============================================================================
" => Editing mappings
" =============================================================================
" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

"au BufRead,BufNewFile *.py, *.pyw, *.c, *.cpp, *.h match BadWhiteSpace /\s\+$/
au BufRead,BufNewFile *.c, *.cpp, *.h match BadWhiteSpace /\s\+$/

" =============================================================================
" => Timeout
" =============================================================================
" Deactivate timeout
set ttimeout
set ttimeoutlen=20
set notimeout

" =============================================================================
" => Enable folding
" =============================================================================
" set foldmethod=indent
" set foldlevel=99
" nnoremap <space> za " folding with spacebar

" =============================================================================
" => Others
" =============================================================================
" set cursorline
set showcmd
set noshowmode
set autowrite
set path+=**
set shell=/bin/zsh
set ttyfast
:au FocusLost * :wa
set number
set numberwidth=5
:au VimEnter,InsertLeave * :set rnu
:au InsertEnter * :set nornu
set splitbelow
set splitright

command! -nargs=0 W w !sudo tee % > /dev/null

" Fzy
function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . " | fzy ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction

nnoremap <leader>e :call FzyCommand("find . -type f", ":e")<cr>
nnoremap <leader>v :call FzyCommand("find . -type f", ":vs")<cr>
nnoremap <leader>s :call FzyCommand("find . -type f", ":sp")<cr>
