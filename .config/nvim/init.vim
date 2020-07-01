"           _   _         __     ___
"          | \ | | ___  __\ \   / (_)_ __ ___
"          |  \| |/ _ \/ _ \ \ / /| | '_ ` _ \
"          | |\  |  __/ (_) \ V / | | | | | | |
"          |_| \_|\___|\___/ \_/  |_|_| |_| |_|
"
" Neovim documentation https://neovim.io/doc/user/vim_diff.html
" Vim options: http://vimdoc.sourceforge.net/htmldoc/options.html
"==============================================================================

" Plugins Manager
call plug#begin('~/.local/share/nvim/plugged')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-clang'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'jiangmiao/auto-pairs'
    Plug 'bronson/vim-trailing-whitespace'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'fatih/vim-go'
    Plug 'udalov/kotlin-vim'
    Plug 'joshdick/onedark.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'yggdroot/indentline'
    Plug 'mboughaba/i3config.vim'
    Plug 'cespare/vim-toml'
call plug#end()

" Plugins Settings
    let mapleader=","

    let g:deoplete#enable_at_startup=1

    let g:deoplete#sources#clang#libclang_path='/usr/lib/libclang.so'
    let g:deoplete#sources#clang#clang_header='/usr/lib/clang/'
    let g:deoplete#sources#clang#sort_algo='priority'
    let g:deoplete#sources#clang#include_default_arguments='True'

    let g:airline_powerline_fonts=1
    let g:airline_theme='onedark'

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

"==============================================================================
" Settings
    colorscheme onedark
    hi Normal guibg=NONE ctermbg=NONE
    set termguicolors

" Save undo history
    set undofile

" Line numbers
    set number relativenumber
    set numberwidth=5
    " :au VimEnter,InsertLeave * :set relativenumber
    " :au InsertEnter * :set norelativenumber

" Chars
    set list
    set listchars=tab:▸\ ,eol:¬,nbsp:+

    set expandtab
    set smarttab
    set shiftwidth=4
    set tabstop=4
    set softtabstop=4

    au FileType c,cpp,h,css,html,sql,sh,yml,yaml,toml setlocal sw=2 ts=2 sts=2

" Auto reload file when it is changed outside
    set autoread

    set clipboard=unnamed
    set clipboard=unnamedplus

    set wildmenu
    set wildignore=*.o,*~,*.pyc

    set ruler

    set ignorecase
    set smartcase

    set incsearch
    set hlsearch

    set lazyredraw

" Turn on magic for regex
    set magic

    set showmatch

    set noerrorbells
    set novisualbell
    set t_vb=
    set tm=500

    set ffs=unix,dos,mac

    set nobackup
    set nowritebackup
    set noswapfile

    set linebreak
    set textwidth=120

    set autoindent
    set smartindent
    set wrap

    set fileformat=unix

    set laststatus=2

    set ttimeout
    set ttimeoutlen=20
    set notimeout

    set showcmd
    set noshowmode
    set autowrite
    set path+=**
    set shell=/bin/zsh
    set ttyfast
    " :au FocusLost * :wa

    set splitbelow splitright

"==============================================================================
" Key maps
" Moving between splits with Ctrl + vim keys
    map <C-j> <C-W>j
    map <C-k> <C-W>k
    map <C-h> <C-W>h
    map <C-l> <C-W>l

" Disable arrow keys
    noremap <Up> <NOP>
    noremap <Down> <NOP>
    noremap <Left> <NOP>
    noremap <Right> <NOP>
"==============================================================================
" Functions
" ag - the silver searcher
if executable('ag')
    " Prefer over vim grep
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    set grepformat=%f:%l:%c%m

    " Use ag in CtrlP
    let g:ctrlp_user_command='ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching=0
endif

" Delete trailing white spaces on save
function! DeleteTrailingWhiteSpaces()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunction
autocmd BufWrite *.py, *.c, *.h, *.java, *.go :call DeleteTrailingWhiteSpaces()

au BufRead,BufNewFile *.py, *.pyw, *.c, *.cpp, *.h, *.java match BadWhiteSpace /\s\+$/

" Close auto completion window
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Write file with higher permission
" command W w !sudo tee "%" > /dev/null

" Fzy
function! FzyCommand(choice_command, vim_command)
    try
        let output = system(a:choice_command . " | fzy ")
    catch /Vim:Interrupt/
        " swallow errors from ^C, allow redraw! below
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
aug i3ConfigFileDetection
    au!
    au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

