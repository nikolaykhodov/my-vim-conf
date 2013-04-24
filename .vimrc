" Init pathogen
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

nnoremap <C-S-n> :NERDTreeToggle<CR>

" Searching
autocmd InsertEnter * :setlocal nohlsearch
autocmd InsertLeave * :setlocal hlsearch
set incsearch

" Autoindenting
set shiftwidth=4
set autoindent
set tabstop=4 
set expandtab

" Enable russian layout
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>


" Folding
set foldmethod=indent
set foldlevel=99

" Ease window moving
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Syntax Highlighting and Validation

" Enable syntax highlighing
syntax on                           

" Show line numbers
set number

" Better color maps for syntax highlighting
set term=screen-256color
set t_Co=256
set background=light
colorscheme solarized

" Try to detect filetypes
filetype on                          
filetype plugin on
filetype plugin indent on    " enable loading indent file for filetype

" Code Completion
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" Strip trailing whitespaces
autocmd FileType c,cpp,java,php,js,py autocmd BufWritePre <buffer> :%s/\s\+$//g
