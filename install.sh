#!/usr/bin/env bash


# Get current dir (so run this script from anywhere)
export DOTFILES_DIR 
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Make utilities available

EXTRA_PATH=$DOTFILES_DIR/bin:~/.pub-cache/bin
PATH="$EXTRA_PATH/bin:$PATH"

# Bunch of symlinks

ln -sfv "$DOTFILES_DIR/.zshrc" ~
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~

# Package managers & packages

cd $HOME


git clone https://github.com/robbyrussell/oh-my-zsh.git 
