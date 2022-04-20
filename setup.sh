cd ${HOME}
git clone https://github.com/Homebrew/brew .linuxbrew
.linuxbrew/bin/brew update --force --quiet
echo 'eval "$(.linuxbrew/bin/brew shellenv)"' >> .profile
cat <<EOT >> .bashrc
/bin/zsh
exit
EOT
eval "$(.linuxbrew/bin/brew shellenv)"
brew install --force-bottle binutils
brew install --force-bottle gcc

git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

cd ${HOMEBREW_PREFIX}/bin
ln -s gcc-11 gcc 
ln -s g++-11 g++ 
ln -s cpp-11 cpp 
ln -s c++-11 c++

DIR=SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd ${HOME}
REL=$(realpath --relative-to="${HOME}" "${DIR}")
if [ -f "${HOME}/.zshrc" ]; then 
    echo "~/.zshrc exists, moving it to ~/.zshrc.backup"
    mv ${HOME}/.zshrc ${HOME}/.zshrc.backup
fi
ln -s ${DIR}/.zshrc .zshrc
ln -s ${DIR}/.p10k.zsh .p10k.zsh