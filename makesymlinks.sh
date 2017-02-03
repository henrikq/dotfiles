#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
backupdir=$dir/dotfiles_backup             # old dotfiles backup directory
files="bashrc vimrc vim opera profile pythonrc"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo -n "Creating $backupdir for backup of any existing dotfiles in ~ ..."
mkdir -p $backupdir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Backing up any existing dotfiles from ~ to $backupdir"
    mv --backup=numbered ~/.$file $backupdir
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

