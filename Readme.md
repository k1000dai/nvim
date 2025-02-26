# vim config for kohei 
## setup
0. install build tools
```
apt install -y build-essential cmake gettext
```
1. install neovim
```
git clone https://github.com/neovim/neovim \
    && cd neovim \
    && make CMAKE_BUILD_TYPE=RelWithDebInfo \
    && make install
```
2. edit .bashrc
```
echo "export XDG_CONFIG_HOME=${HOME}/.config" >> ~/.bashrc
echo "alias vim=nvim" >> ~/.bashrc
source ~/.bashrc
```
3. git clone this repository
```
git clone https://github.com/k1000dai/nvim ~/.config/nvim
```
4. install dein.vim
```
git clone https://github.com/Shougo/dein.vim ~/.cache/dein/repos/github.com/Shougo/dein.vim
```
5. install nodejs
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
source ~/.bashrc
nvm install --lts
nvm install node
```
6. install ripgrep and clangd
```
apt install -y ripgrep
apt install -y clangd
```
