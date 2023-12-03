"call plug#begin('~/.vim/plugged')
"Plug 'scrooloose/nerdtree'
"Plug 'tpope/vim-fugitive'
"Plug 'neoclide/coc.nvim', {'for': 'python', 'branch': 'release'}
"Plug 'davidhalter/jedi-vim',  {'for': 'python'}
"call plug#end()
set tabstop=2
set shiftwidth=2
set expandtab
filetype plugin indent on
colo Tomorrow-Night
set statusline=%F
let mapleader =";"
noremap ;; :w<cr>
nmap ,, :bp<cr>
nmap .. :bn<cr>
nmap ss :source ~/.vimrc<cr>
nmap @@ @:
nmap pp :PlugStatus<cr>
nmap ` <C-w><C-w>
nmap <leader>v :vsplit<cr>
nmap <leader>x `<cr> \| :only<cr>
nmap <leader>b :Gblame<cr>
nmap <leader>2 :!python %<cr>
nmap <leader>t :!python3 %<cr>
map <C-k> <C-w><up>
map <C-j> <C-w><down>
map <C-h> <C-w><left>
map <C-l> <C-w><right>
tnoremap <C-k> <C-w><up>
tnoremap <C-j> <C-w><down>
tnoremap <C-h> <C-w><left>
tnoremap <C-l> <C-w><right>
