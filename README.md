# DOTFILES
[![GitHub](https://img.shields.io/github/license/tungbeier/dotfiles)](https://raw.githubusercontent.com/tungbeier/dotfiles/master/LICENSE)
<br/>
Dotfiles setup using git bare repository functionality.

## How to track the dotfiles with a bare repository
- Create a placeholder<br>
`mkdir $HOME/dotfiles`
- Initialize bare repository<br>
`git init --bare $HOME/dotfiles`
- Create alias to interact with the dotfiles<br>
`alias dot='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'`<br/>
so instead of `git add` or `git status`, use `dot add`, `dot status` etc.
- Setup status to not show untracked files<br>
`dot config --local status.showUntrackedFiles no`
- Add remote<br>
`dot remote add origin <remote-git-repository>`

## Show currently tracked files
`dot ls-tree -r master --name-only`

## Setting up a new machine
- Clone to a temporary folder<br>
`git clone --separate-git-dir=$HOME/dotfiles <remote-git-url> tmp-dotfiles`
- Synchronize files<br>
`rsync --recursive --verbose --exclude '.git' tmp-dotfiles/ $HOME/`
- Remove the temporary folder<br>
`rm -rf tmp-dotfiles`

