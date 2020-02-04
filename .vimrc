call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'for': 'python', 'branch': 'release'}
Plug 'davidhalter/jedi-vim',  {'for': 'python'}
call plug#end()
filetype plugin indent on
colo Tomorrow-Night
let mapleader =";"
noremap ;; :w<cr>
nmap ,, :bp<cr>
nmap .. :bn<cr>
nmap ss :source ~/.vimrc<cr>
nmap <leader>r :!python3 %<cr>
nmap pp :PlugStatus<cr>
nmap <leader>g :!go build % <cr> \|:!./%:r<cr>
