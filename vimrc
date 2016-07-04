set nocompatible
set clipboard=unnamed
set number
syntax on
set ruler
filetype plugin indent on    " required
set pastetoggle=<insert>
set shiftwidth=2
set softtabstop=2
let mapleader=","
imap jj <Esc>
imap ;; <esc>:w<cr>
nmap ;; <esc>:w<cr>
imap zz <esc>:x<cr>
nmap zz <esc>:x<cr>
" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>
:command W w
colorscheme tomorrow-night
cnoremap <expr> X (getcmdtype() is# ':' && empty(getcmdline())) ? 'x' : 'X'
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
match OverLength /\%81v.\+/

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
set pastetoggle=<insert>
