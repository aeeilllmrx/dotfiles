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

set ruler " Always show current position.
set magic " For regular expressions turn magic on.

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

" ctrlp plugin
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


" **********************
" VIM-GO STUFF
" **********************
" autowrite edits while fixing build bugs
set autowrite

" cycle forward and back through bugs
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>

" close bug window
nnoremap <leader>a :cclose<CR>

" shortcuts for build / run
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

" don't look for compile errors every time file is saved
let g:go_fmt_fail_silently = 1

" highlight all sorts of stuff
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1

" set shortcut (\i) to get signature of method
autocmd FileType go nmap <Leader>i <Plug>(go-info)

" NERDTree
noremap <leader>f :NERDTreeToggle<CR>
noremap <leader>t :TagbarToggle<CR>

" vim-better-whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" Switching windows.
noremap <leader>w <C-w>p
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" lightline
set laststatus=2

syntax on
