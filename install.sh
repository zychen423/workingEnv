#! /bin/bash
# install vimrc
echo "This script will delete all file in ~/.vim/ and ~/.vimrc, are you sure to continue?(y/N)"
read ans
if [ "$ans" = "n" ] || [ "$ans" = "N" ] || [ -z "$ans" ]; then
    echo "User declined, exiting......"
    exit 0
fi
if [ -d "$HOME/.vim" ]; then
    echo "deleting ~/.vim"
    rm -rf $HOME/.vim
fi
if [ -f "$HOME/.vimrc" ]; then
    echo "deleting ~/.vimrc"
    rm -rf $HOME/.vimrc
fi

echo "Install zsh"
sudo apt-get install -y zsh 
echo "Now fetching and install new vim configuration"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp vimrc ~/.vimrc
vim +PluginInstall +qall
echo "Finish vim coniguration!"

# install zim with curl
$ curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh


echo "setting up ~/.zshrc"
cp ./tmux.conf ~/.tmux.conf


echo "Finish!!"
