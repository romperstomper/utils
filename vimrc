set nocompatible
set splitbelow
set splitright
set gdefault
autocmd filetype crontab setlocal nobackup nowritebackup
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'
Plugin 'christoomey/vim-tmux-navigator'
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
set pastetoggle=<leader>p
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
noremap <leader>p "+P
noremap <leader>u <c-w>R
nnoremap <leader><leader> <c-^>
nnoremap <leader>d <esc>:!pwd<cr>
nnoremap <leader>e /\s\+$<cr>
nnoremap <leader>q <esc>:q!<cr>
nnoremap <leader>l <esc>:ls<CR>
nnoremap <leader>s <C-w>v
nnoremap <leader>h :sp<CR>
nnoremap <leader>o <C-w><C-o>
nnoremap <leader>f :! rake serverspec[false]<CR>
nnoremap <leader>c :ccl<CR>
nnoremap <leader>R :call RunTest()<cr>
nnoremap <leader>t :exec 'silent :!echo "python3 -m unittest %" > testrun' \| :exec 'redraw!'<cr> 
nnoremap <leader>g <leader>vv
nnoremap <leader>. :so ~/.vimrc<cr>
nnoremap <leader>w :w !sudo tee > /dev/null %<cr>
nnoremap ff :NERDTreeToggle<cr>
nnoremap <C-x> <c-w>q
nnoremap <C-a> ^
nnoremap <C-e> $
nnoremap <C-m> :bprevious<CR>
nnoremap <C-n> :bnext<CR>
nnoremap .. <C-w><C-w>
nnoremap qq <esc>:q!<cr>
nnoremap zz <esc>:xa<cr>
nnoremap ee <esc>:e<CR>
nnoremap ;; :w<cr>
nnoremap ,, :b#<cr>

imap <c-z> <esc><c-z><cr>

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-f> :TmuxNavigatePrevious<cr>
let g:tmux_navigator_save_on_switch = 2

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
" let g:solarized_termcolors = 256
colorscheme Tomorrow-Night
set autoread

augroup autoSaveAndRead
    autocmd!
    autocmd TextChanged,InsertLeave,FocusLost * silent! wall
    autocmd CursorHold * silent! checktime
augroup END
