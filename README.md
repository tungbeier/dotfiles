# DOTFILES
Dotfiles setup using git bare repository functionality.

## Setup
- Create a placeholder<br>
`mkdir $HOME/dotfiles`
- Initialize bare repository<br>
`git init --bare $HOME/dotfiles`
- Create alias<br>
`alias dot='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'`
- Setup status to not show untracked files<br>
`dot config --local status.showUntrackedFiles no`
- Add remote<br>
`dot remote add origin <remote-git-repository>`

## Setting up a new machine
- Clone to a temporary folder<br>
`git clone --separate-git-dir=$HOME/dotfiles <remote-git-url> tmp-dotfiles`
- Synchronize files<br>
`rsync --recursive --verbose --exclude '.git' tmp-dotfiles/ $HOME/`
- Remove the temporary folder<br>
`rm -rf tmp-dotfiles`

