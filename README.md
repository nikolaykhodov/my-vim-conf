#My VIM config

Installation:

    git clone https://github.com/nikolaykhodov/my-vim-conf ~/.vim
    
    cd ~/.vim
    git submodule init
    git submodule update
    mkdir -p ./autoload && cp ./bundle/pathogen/autoload/pathogen.vim ./autoload
    
    cp ./.vimrc ~/
