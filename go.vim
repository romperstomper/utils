" This file represents the minimal .vimrc needed to work with govim.
"
" We also include a number of suggested settings that we think the majority of
" users will like/prefer.

set nocompatible
set nobackup
set nowritebackup
set noswapfile

filetype plugin on

set mouse=a

" To get hover working in the terminal we need to set ttymouse. See
"
" :help ttymouse
"
" for the appropriate setting for your terminal. Note that despite the
" automated tests using xterm as the terminal, a setting of ttymouse=xterm
" does not work correctly beyond a certain column number (citation needed)
" hence we use ttymouse=sgr
set ttymouse=sgr

" Suggestion: By default, govim populates the quickfix window with diagnostics
" reported by gopls after a period of inactivity, the time period being
" defined by updatetime (help updatetime). Here we suggest a short updatetime
" time in order that govim/Vim are more responsive/IDE-like
set updatetime=500

" Suggestion: To make govim/Vim more responsive/IDE-like, we suggest a short
" balloondelay
set balloondelay=250

" Suggestion: Turn on the sign column so you can see error marks on lines
" where there are quickfix errors. Some users who already show line number
" might prefer to instead have the signs shown in the number column; in which
" case set signcolumn=number
set signcolumn=yes

" Suggestion: Turn on syntax highlighting for .go files. You might prefer to
" turn on syntax highlighting for all files, in which case
"
syntax on
"
" will suffice, no autocmd required.
autocmd! BufEnter,BufNewFile *.go syntax on
autocmd! BufLeave *.go syntax off

" Suggestion: turn on auto-indenting. If you want closing parentheses, braces
" etc to be added, https://github.com/jiangmiao/auto-pairs. In future we might
" include this by default in govim.
set autoindent
set smartindent
filetype indent on

" Suggestion: define sensible backspace behaviour. See :help backspace for
" more details
set backspace=2

" Suggestion: show info for completion candidates in a popup menu
if has("patch-8.1.1904")
  set completeopt+=popup
  set completepopup=align:menu,border:off,highlight:Pmenu
endif

function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction

inoremap <tab> <c-r>=Smart_TabComplete()<CR>

" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
if GOVIMPluginStatus() == "initcomplete"
  " Hover
  setlocal balloonexpr=GOVIM_internal_BalloonExpr()

  " Completion
  setlocal omnifunc=GOVIM_internal_Complete

  " go-to-def
  nnoremap <buffer> <silent> gd :GOVIMGoToDef<cr>
  nnoremap <buffer> <silent> <C-]> :GOVIMGoToDef<cr>
  nnoremap <buffer> <silent> <C-LeftMouse> <LeftMouse>:GOVIMGoToDef<cr>
  nnoremap <buffer> <silent> g<LeftMouse> <LeftMouse>:GOVIMGoToDef<cr>
  nnoremap <buffer> <silent> <C-t> :GOVIMGoToPrevDef<cr>
  nnoremap <buffer> <silent> <C-RightMouse> :GOVIMGoToPrevDef<cr>
  nnoremap <buffer> <silent> g<RightMouse> :GOVIMGoToPrevDef<cr>

  " Motions
  nnoremap <buffer> <silent> [[ :call GOVIMMotion("prev", "File.Decls.Pos()")<cr>
  nnoremap <buffer> <silent> [] :call GOVIMMotion("prev", "File.Decls.End()")<cr>
  nnoremap <buffer> <silent> ]] :call GOVIMMotion("next", "File.Decls.Pos()")<cr>
  nnoremap <buffer> <silent> ][ :call GOVIMMotion("next", "File.Decls.End()")<cr>
endif
