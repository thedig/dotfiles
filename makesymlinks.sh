#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# taken from http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
############################

########## Variables

# dotfiles directory
dir=~/dotfiles                    
# list of files/folders to symlink in homedir
files="bashrc bash_profile path bash_prompt exports aliases functions extra inputrc gitconfig"    

##########

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -s $dir/.$file ~/.$file
done

# gitconfig file is in its own directory so as not to conflict with gitconfig for this particular repo
ln -s $dir/git-dotfiles/ ~/.gitconfig

# install_zsh () {
# # Test to see if zshell is installed.  If it is:
# if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
#     # Clone my oh-my-zsh repository from GitHub only if it isn't already present
#     if [[ ! -d $dir/oh-my-zsh/ ]]; then
#         git clone http://github.com/michaeljsmalley/oh-my-zsh.git
#     fi
#     # Set the default shell to zsh if it isn't currently set to zsh
#     if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
#         chsh -s $(which zsh)
#     fi
# else
#     # If zsh isn't installed, get the platform of the current machine
#     platform=$(uname);
#     # If the platform is Linux, try an apt-get to install zsh and then recurse
#     if [[ $platform == 'Linux' ]]; then
#         sudo apt-get install zsh
#         install_zsh
#     # If the platform is OS X, tell the user to install zsh :)
#     elif [[ $platform == 'Darwin' ]]; then
#         echo "Please install zsh, then re-run this script!"
#         exit
#     fi
# fi
# }

# install_zsh