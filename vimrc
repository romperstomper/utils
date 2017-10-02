set nocompatible
set splitbelow
set splitright
set gdefault
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'
Plugin 'dkprice/vim-easygrep'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax enable
highlight SpecialKey ctermfg=1
set incsearch
set list
set listchars=tab:T>
" cross-platform way to share the vim clipboard with the system clipboard
set clipboard^=unnamed,unnamedplus
set ruler
set expandtab
filetype plugin indent on    " required
set pastetoggle=<insert>
set shiftwidth=2
set softtabstop=2

autocmd VimResized * wincmd =
let mapleader="\\"
"uncomment to enable indent lines
let g:indentLine_enabled = 0
nmap <leader>h :echo g:indentLine_enabled<CR>
nmap <leader>k :let g:indentLine_enabled=0<CR>
nmap <leader>j :let g:indentLine_enabled=1<CR>
nmap <leader>i :PluginInstall<cr>
noremap <leader>r @:
noremap <leader>u <c-w>R
nnoremap <leader><leader> <c-^>
nnoremap <leader>p <esc>:!pwd<cr>
nnoremap <leader>e /\s\+$<cr>
nnoremap <leader>q <esc>:q!<cr>
nnoremap <leader>l <esc>:ls<CR>
nnoremap <leader>s <C-w>S
nnoremap <leader>c :ccl<CR>
nnoremap <leader>V <C-w>v
nnoremap <leader>s <C-w>h
nnoremap <leader>g <leader>vv
nnoremap <leader>. :so ~/.vimrc<cr>
nnoremap <leader>w :w !sudo tee > /dev/null %<cr>
nnoremap ff :NERDTreeToggle<cr>
nnoremap <C-x> :bd <CR>
nnoremap <C-a> ^
nnoremap <C-e> $
nnoremap <C-m> :bprevious<CR>
nnoremap <C-n> :bnext<CR>
nnoremap .. <C-w><C-w>
nnoremap qq <esc>:q!<cr>
nnoremap zz <esc>:xa<cr>
nnoremap ee <esc>:e<CR>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap ;; :w<cr>
nnoremap ,, :b#<cr>

imap <c-z> <esc><c-z><cr>
imap <c-l> <space>=><space>
imap ;; :w<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i


" run the current test
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Run Test
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RunTest()
  let line_number = line('.')
  if line_number == '1'
    exec ':!rspec 'expand('%')
  else
    let mytest = expand('%').":".line('.')
    exec ':!rspec 'mytest
  endif
endfunction
nnoremap <leader>t :call RunTest()<cr>

" Insert a hash rocket with <c-l>
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
set undofile
set undodir=$HOME/.vim
colorscheme Tomorrow-Night
set autoread

augroup autoSaveAndRead
    autocmd!
    autocmd TextChanged,InsertLeave,FocusLost * silent! wall
    autocmd CursorHold * silent! checktime
augroup END
