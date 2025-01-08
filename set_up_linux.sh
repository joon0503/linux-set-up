#!/bin/sh
sudo apt-get install -y curl git vim zsh cmake build-essential

# install omz
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

####
# install powerline-10k
####

# 1. install recommended font
curl -L -o /usr/local/share/fonts/MesloLGS%20NF%20Regular.ttf ~/Downloads/test.file https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
curl -L -o /usr/local/share/fonts/MesloLGS%20NF%20Bold.ttf ~/Downloads/test.file https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
curl -L -o /usr/local/share/fonts/MesloLGS%20NF%20Italic.ttf ~/Downloads/test.file https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
curl -L -o /usr/local/share/fonts/MesloLGS%20NF%20Bold%20Italic.ttf ~/Downloads/test.file https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

fc-cache -f

# 2. intsall powerline-10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# 3. replace zsh theme
sed -i 's|^ZSH_THEME="robbyrussell"|ZSH_THEME="powerlevel10k/powerlevel10k"|' ~/.zshrc

# 4. blah
