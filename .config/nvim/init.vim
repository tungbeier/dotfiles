"      _   _         __     ___              ____             __ _
"     | \ | | ___  __\ \   / (_)_ __ ___    / ___|___  _ __  / _(_) __ _
"     |  \| |/ _ \/ _ \ \ / /| | '_ ` _ \  | |   / _ \| '_ \| |_| |/ _` |
"     | |\  |  __/ (_) \ V / | | | | | | | | |__| (_) | | | |  _| | (_| |
"     |_| \_|\___|\___/ \_/  |_|_| |_| |_|  \____\___/|_| |_|_| |_|\__, |
"                                                                  |___/
"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc

for file in split(glob('$HOME/.config/nvim/config/*.vim'), '\n')
    exe 'source' file
endfor

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Leader
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let mapleader = ","

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Line number
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set number
set numberwidth=5
:au VimEnter,InsertLeave * :set relativenumber
:au InsertEnter * :set norelativenumber

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
