set nocompatible
syntax on
set ruler
filetype plugin indent on    " required
set pastetoggle=<insert>
set shiftwidth=2
set softtabstop=2

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" use 256 colors (must be supported by xterm and screen)
>>>>>>> 9e17bf393d8a6a3e22f1a62a73bdcf6190f2afb7
set t_Co=256
set background=dark
set ignorecase
set ls=2
set mouse=a
set number

if has("autocmd")
  autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif
endif

" Better file completion
set wildmenu
set wildmode=list:longest,full
