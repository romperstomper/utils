call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'for': 'python', 'branch': 'release'}
Plug 'davidhalter/jedi-vim',  {'for': 'python'}
call plug#end()
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
