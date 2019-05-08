set nocompatible
set splitbelow
set splitright
set gdefault
colorscheme Tomorrow-Night
autocmd filetype crontab setlocal nobackup nowritebackup
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'
Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'deoplete-plugins/deoplete-jedi'
Plugin 'davidhalter/jedi-vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
let g:jedi#completions_command = "<C-j>"
let g:jedi#rename_command = "<leader>]"
set undodir=~/.vim/undodir
set undofile

" Write all buffers before navigating from Vim to tmux panel 1=update, 2=write all
let g:tmux_navigator_save_on_switch = 2
color Tomorrow-Night
filetype plugin indent on    " required
syntax enable
highlight SpecialKey ctermfg=1
set incsearch
set list
set listchars=tab:T>
" cross-platform way to share the vim clipboard with the system clipboard
""set clipboard^=unnamed,unnamedplus
set clipboard+=unnamed
set ruler
set expandtab
set pastetoggle=<leader>p
set shiftwidth=4
set softtabstop=4
autocmd VimResized * wincmd =
let mapleader=";"
"uncomment to enable indent lines
let g:indentLine_enabled = 0
nnoremap <F3> :set hlsearch!<CR>
noremap <leader>h :echo g:indentLine_enabled<CR>
noremap <leader>j :let g:indentLine_enabled=1<CR>
noremap <leader>k :let g:indentLine_enabled=0<CR>
noremap <leader>i :PluginInstall<cr>
noremap <leader>b :Gblame<cr>
noremap <leader>r @:
noremap <leader>u <c-w>R
noremap <leader><leader> <c-^>
noremap <leader>d <esc>:!pwd<cr>
noremap <leader>i :PluginInstall!<cr>
noremap <leader>s :split<cr>
noremap <leader>v :vsplit<cr>
nnoremap <leader>x :bd <cr>
nnoremap <leader>r @:<cr>
noremap <leader>u <c-w>R
noremap <leader><leader> <c-^>
noremap <leader>p "+P
noremap <leader>e /\s\+$<cr>
noremap <leader>q <esc>:q!<cr>
noremap <leader>l <esc>:ls<CR>
noremap <leader>o <C-w><C-o>
"nnoremap <leader>R :call RunTest()<cr>
noremap <leader>t :!python3 %<cr>
"noremap <C-t> :execute 'silent !echo "python3.4 -m unittest %" > runtests' | :execute redraw!
noremap <leader>f :exec 'silent !echo "python3 -m unittest %" > testfifo'\| :exec 'redraw!' <cr>
noremap <leader>g <leader>vv
noremap <leader>. :so ~/.vimrc<cr>
noremap <leader>w :w !sudo tee > /dev/null %<cr>
""noremap <leader>y y|:@" <cr>
noremap ff :NERDTreeToggle<cr>
noremap <C-x> <c-w>q
noremap <C-a> ^
noremap <C-e> $
noremap .. :bprevious<CR>
noremap ,, :bnext<CR>
noremap <Space> <C-w><C-w>
noremap Q <esc>:q!<cr>
noremap qq <esc>:xa<cr>
noremap ee <esc>:e<CR>
noremap ;; :w<cr>
imap <c-z> <esc><c-z><cr>

let g:tmux_navigator_no_mappings = 1

noremap <silent> <c-h> :TmuxNavigateLeft<cr>
noremap <silent> <c-j> :TmuxNavigateDown<cr>
noremap <silent> <c-k> :TmuxNavigateUp<cr>
noremap <silent> <c-l> :TmuxNavigateRight<cr>
noremap <silent> <c-f> :TmuxNavigatePrevious<cr>
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
"function! RunTest()
"  let line_number = line('.')
"  if line_number == '1'
"    exec ':!rspec 'expand('%')
"  else
"    let mytest = expand('%').":".line('.')
"    exec ':!rspec 'mytest
"  endif
"endfunction

""""""""""""""
" tmux fixes "
""""""""""""""
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%99v.\+/
autocmd Filetype python setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
":map <F2> :echo 'Current time is ' . strftime('%c')<CR>
"PEP8 style
source $VIMRUNTIME/vimrc_example.vim
set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END
