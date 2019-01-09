# Outline

.bashrc templates.

# Installation

```
$ git clone git@gitlab.com:george.n/bashrc.git .bashrc.d
```

# Local environment setting

```
$ pwd
/home/xxxx/.bashrc.d
$ cp .org.bashrc_local .bashrc_local

vim .bashrc_local

$ sh setup.sh
```

# Architecture

## Common files

Following files should not be edited each computer.
These files are used as a common setting in all environments.

 - .bash_profile
 - .bashrc
 - .bashrc_common_global
 - .gitconfig
 - .vimrc

## Local files

Following files are edited if you needs.
These files provide a local setting each environments.

 - org.bashrc_common
 - org.bashrc_local
 - org.fzf_local
 - org.gitconfig_local

## Setup script

This script links earch dotfiles to your home directory.

 - setup.sh

# Tips

## rsync remote server

```
rsync -av ~/.bashrc.d/ serverhost:/home/xxxx/.bashrc.d/ --delete --exclude=".git/" --exclude=".*_local" --include="*"
```