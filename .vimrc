set nocompatible
source /usr/share/vim/google/google.vim  " Initialize some basic settings.
Glug youcompleteme-google
Glug codefmt-google auto_filetypes+=blazebuild
syntax on
set ruler
filetype plugin indent on    " required


" Google vim useful stuff -- https://wiki.corp.google.com/twiki/bin/view/Main/VimEditor
" first, enable status line always
" w set it up to change the status line based on mode
set laststatus=2
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=magenta
  elseif a:mode == 'r'
    hi statusline guibg=blue
  else
    hi statusline guibg=red
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertChange * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=green

" default the statusline to green when entering Vim
hi statusline guibg=green







syntax on
source /usr/share/vim/google/google.vim
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" my own from here on

" use 256 colors (must be supported by xterm and screen)
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
