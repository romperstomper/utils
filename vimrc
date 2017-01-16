set nocompatible
highlight SpecialKey ctermfg=1
set list
set listchars=tab:T>
" cross-platform way to share the vim clipboard with the system clipboard
set clipboard^=unnamed,unnamedplus
syntax on
set ruler
set expandtab
filetype plugin indent on    " required
set pastetoggle=<insert>
set shiftwidth=2
set softtabstop=2
let mapleader=","
noremap <leader>r @:
nnoremap <leader><leader> <c-^> 
nnoremap <leader>z <esc>:x<cr> 
"nnoremap <leader>w :!sudo tee % > /dev/null - needs work
nnoremap \ /\s\+$<cr>
nnoremap <leader>q <esc>:qa!<cr> 
nnoremap .. <C-w><C-w>
nnoremap <leader>s <C-w>S
nnoremap <leader>v <C-w>v

" run the current test
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Run Test
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RunTest()
  let line_number = line('.')
  if line_number == '1'
    exec ':!bundle exec rspec 'expand('%')
  else
    let mytest = expand('%').":".line('.')
    exec ':!bundle exec rspec 'mytest
  endif
endfunction
nnoremap <leader>t :call RunTest()<cr>

imap jj <Esc>
imap ;; <esc>:w<cr>
nmap ;; <esc>:w<cr>
" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
colorscheme tomorrow-night
""""""""""""""
" tmux fixes "
""""""""""""""
" Handle tmux $TERM quirks in vim
if $TERM =~ '^screen-256color'
    map <Esc>OH <Home>
    map! <Esc>OH <Home>
    map <Esc>OF <End>
    map! <Esc>OF <End>
endif


highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%99v.\+/

" use 256 colors (must be supported by xterm and screen)
set t_Co=256
set background=dark
set ignorecase
set ls=2
set mouse=a
autocmd Filetype python setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2 

if has("autocmd")
  autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif
endif

" Better file completion
set wildmenu
set wildmode=list:longest,full
set pastetoggle=<leader>p
set undofile
set undodir=$HOME/.vim
