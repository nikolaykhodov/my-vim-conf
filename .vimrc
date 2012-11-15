" Init pathogen
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"Ctrl+L switches search highlighting"
nnoremap <C-S-n> :NERDTreeToggle<CR>

" Searching

autocmd InsertEnter * :setlocal nohlsearch
autocmd InsertLeave * :setlocal hlsearch
set incsearch

filetype plugin on


set wildchar=<Tab> wildmenu wildmode=full

"Easy buffer switching"
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>

" Autoindenting
set shiftwidth=4
set autoindent
set tabstop=4 
set expandtab

" Tab switching
set tabpagemax=20
if version >= 700
  map <C-t> <Esc>:tabnew<CR>
  map <A-PageDown> <Esc>:tabnext<CR>
  map <A-PageUp> <Esc>:tabprev<CR>
	
endif

" Save session on quitting Vim
autocmd VimLeave * NERDTreeClose

"Restore session on starting Vim
autocmd VimEnter * NERDTree

filetype plugin indent on
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

" Better color maps for syntax highlighting
set background=dark

" Folding
set foldmethod=indent
set foldlevel=99

" Ease window moving
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" Task List
map <leader>td <Plug>TaskList

" Revision History
map <leader>g :GundoToggle<CR>


" Syntax Highlighting and Validation
syntax on                           " syntax highlighing
filetype on                          " try to detect filetypes
filetype plugin indent on    " enable loading indent file for filetype

" PEP8
let g:pep8_map='<leader>8'

" Code Completion
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" Refactoring and Go to definition
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

" Searching
nmap <leader>a <Esc>:Ack!


" py.test
" Execute the tests
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
" cycle through test errors
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

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
