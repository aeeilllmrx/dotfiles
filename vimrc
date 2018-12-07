set nocompatible

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set t_vb=
set autoread                    "Reload files changed outside vim

set autoindent

set wrap       "Wrap lines
set textwidth=120
set linebreak    "Wrap lines at convenient points

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...

set mouse=a

filetype plugin indent on

" DON'T CHANGE THIS, this is the good tab space stuff
set tabstop=4
set shiftwidth=4
set expandtab

" python autocomplete
let g:pydiction_location='~/.vim/pydiction/complete-dict' " tab completion
let g:pydiction_menu_height=3

" allows you to run script with F9
inoremap <F9> :w<CR>:!python3 %<CR>

" remap C-x C-b to tab
function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<space>\<space>\<space>\<space>"
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

" remove preview window
set completeopt-=preview

syntax on
