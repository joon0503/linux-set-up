#!/bin/sh
sudo apt-get install -y curl git vim zsh cmake build-essential tmux

# install omz
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

####
# install powerline-10k
####

# 1. install recommended font
sudo curl -L -O --output-dir /usr/local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
sudo curl -L -O --output-dir /usr/local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
sudo curl -L -O --output-dir /usr/local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
sudo curl -L -O --output-dir /usr/local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

fc-cache -f

# 2. intsall powerline-10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# 3. install zsh plugins
sudo apt-get install -y autojump
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# 4. replace .zshrc & .p10k.zsh
cp ./.zshrc $HOME/.zshrc
cp ./.p10k.zsh $HOME/.p10k.zsh

# 5. replace zsh theme
sed -i 's|^ZSH_THEME="robbyrussell"|ZSH_THEME="powerlevel10k/powerlevel10k"|' $HOME/.zshrc

####
# Set up tmux
####
cp .tmux.conf $HOME/.tmux.conf


# git settings
cp .gitconfig $HOME/.gitconfig
