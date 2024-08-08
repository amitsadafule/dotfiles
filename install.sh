sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew install git
brew cask install iterm2
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
#echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
git clone https://github.com/powerline/fonts.git
# shellcheck disable=SC2164
cd fonts
./install.sh
# shellcheck disable=SC2103
cd ..
rm -rf fonts
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-syntax-highlighting
brew install kubectl
brew install docker
brew install colima
brew install jq
brew install bison
export PATH="$(brew --prefix bison)/bin:$PATH"

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cat <<EOF > ~/.vimrc
execute pathogen#infect()
syntax on
filetype plugin indent on

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

let g:NERDTreeFileLines = 1
let NERDTreeShowLineNumbers = 1
au BufWinEnter * set number
EOF

git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree

