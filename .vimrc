"            _
"     __   _(_)_ __ ___  _ __ ___
"     \ \ / / | '_ ` _ \| '__/ __|
"      \ V /| | | | | | | | | (__
"     (_)_/ |_|_| |_| |_|_|  \___|
"
" =============================================================================
" =>Plugins manager
" =============================================================================
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bronson/vim-trailing-whitespace'
Plug 'sheerun/vim-polyglot'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'valloric/youcompleteme'
Plug 'fatih/vim-go'
Plug 'udalov/kotlin-vim'
Plug 'joshdick/onedark.vim'
Plug 'airblade/vim-gitgutter'
Plug 'yggdroot/indentline'
Plug 'mboughaba/i3config.vim'

call plug#end()

filetype on
" =============================================================================
" =>Plugins configuration
" =============================================================================
" Disable language support
let g:polyglot_disabled = ['markdown']

" Leader
let mapleader = ","

" YouCompleteMe
let g:syntastic_java_checkers = []
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

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

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'onedark'

let g:onedark_termcolors=16

" The silver searcher
if executable('ag')
    " Use ag over vim :grep
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    set grepformat=%f:%l:%c%m

    " Use ag in CtrlP
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif
" =============================================================================
" =>General
" =============================================================================
" Set to auto read when a file is changed from the outside
set autoread

" Set how many lines of history Vim has to remember
set history=1000

set clipboard=unnamed
set clipboard=unnamedplus
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
syntax on
colorscheme onedark
set termguicolors

" Set encoding
set encoding=utf-8

" Use unix as the standard file type
set ffs=unix,dos,mac

" =============================================================================
" => Backups
" =============================================================================
" Deactivate backup
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

au FileType c,cpp,h,css,html,sql,sh,yml setlocal shiftwidth=2 tabstop=2 softtabstop=2

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
autocmd BufWrite * :call DeleteTrailingWS()

au BufRead,BufNewFile *.py, *.pyw, *.c, *.cpp, *.h, *.java match BadWhiteSpace /\s\+$/

" =============================================================================
" => Timeout
" =============================================================================
" Deactivate timeout
set ttimeout
set ttimeoutlen=20
set notimeout

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

" Set transparent background
hi Normal guibg=NONE ctermbg=NONE

"cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
command W w !sudo tee "%" > /dev/null

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

nnoremap <leader>e :call FzyCommand("ag -gS --silent .", ":e")<cr>
nnoremap <leader>v :call FzyCommand("ag -gS --silent .", ":vs")<cr>
nnoremap <leader>s :call FzyCommand("ag -gS --silent .", ":sp")<cr>

" i3 config file detection
aug i3config_ft_detection
    au!
    au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end
