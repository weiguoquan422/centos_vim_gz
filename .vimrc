"Enable file type detection
filetype on
"Load the corresponding plug-in according to the different types detected
filetype plugin on

set nocompatible

"about encoding
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
"make Vim default to Unix line endings while still supporting DOS line endings
set fileformats=unix,dos
set fileformat=unix

"about search and display
"ingnore case when searching with /
set ic
"Enable real-time search
set incsearch
"highlight search
set hlsearch
"set word wrap
set wrap
"Turn on row count display, relative row count display
set number
set relativenumber
"highlight line
set cursorline
"List auto complete Ex menu
set wildmenu
"allow switch buffer without saving current buffer
set hidden
"allow use mouse
set mouse=a

"about fold
set viewoptions=cursor,folds,slash,unix
set foldmethod=manual
set foldlevel=99
set foldenable


"about mapping and Leader
"<Leader> is ';'
let mapleader=";"
"map: copy to clipboard
nmap <Leader>y "+y :let @*=@+<CR>h
vmap <Leader>y "+y :let @*=@+<CR>h
"map: paste from clipboard
nmap <Leader>p "+p
vmap <Leader>p "+p
"alt+right/left to move between buffers
nmap <A-right> <Esc>:bn<CR>
nmap <A-left> <Esc>:bp<CR>

"close current buffer
nmap <Leader>bd :bd<CR>

"vertical partition window
nmap <Leader>wv <Esc>:vs<CR>
"close current window
nmap <Leader>wd <Esc>:q<CR>


"about indent
"Adaptive intelligent indent for filetype
filetype indent on
"Expand tabs to Spaces
set expandtab
"set tabstop
set tabstop=4
"The number of Spaces that tabs occupy when formatting source code
set shiftwidth=4
"Treat a contiguous number of Spaces as a TAB
set softtabstop=4



"about windows and buffers
"Jump to the right window
nnoremap <Leader>wl <C-W>l
"Jump to the left window
nnoremap <Leader>wh <C-W>h
"Jump to the up window
nnoremap <Leader>wk <C-W>k
"Jump to the down window
nnoremap <Leader>wj <C-W>j



" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')


"nerdtree
Plug 'scrooloose/nerdtree'
"color scheme
Plug 'morhetz/gruvbox'
"nerdcommenter--comment
Plug 'scrooloose/nerdcommenter'
"Yggdroot/indentLine--display indent line
Plug 'Yggdroot/indentLine'
"jiangmiao/auto-pairs
Plug 'jiangmiao/auto-pairs'
"mhinz/vim-startify
Plug 'mhinz/vim-startify'
"easymotion
Plug 'easymotion/vim-easymotion'
"rainbow:show different levels of brackets in different colors
Plug 'luochen1990/rainbow'
"vim-SystemVerilog
Plug 'WeiChungWu/vim-SystemVerilog'
"CtrlP
Plug 'ctrlpvim/ctrlp.vim'
"git
Plug 'tpope/vim-fugitive'
"gitgutter--dispaly git diff in gutter
Plug 'airblade/vim-gitgutter'
"align text by some character
Plug 'junegunn/vim-easy-align'
"machakann/vim-sandwich
Plug 'machakann/vim-sandwich'
"weiguoquan422/vim-startsearch:search for word under the cursor but not jump next match, and add the word to search history
Plug 'weiguoquan422/vim-starsearch'


" Initialize plugin system
call plug#end()



"about nerdtree
"toggle Nerdtree
nmap <F3> :NERDTreeToggle<CR>
"set Neartree width
let NERDTreeWinSize=32
"Set NERDTree window location
let NERDTreeWinPos="right"
"Show hidden file
let NERDTreeShowHidden=1
"dont display Redundant help information
let NERDTreeMinimalUI=1
"Automatically deletes the file corresponding to buffer when deleting the file
let NERDTreeAutoDeleteBuffer=1
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"about nerdcommenter
"disable default Mapping of nerdcommenter
let NERDCreateDefaultMappings = 0
"toggle line comment
nmap <leader>cl <plug>NERDCommenterToggle
vmap <leader>cl <plug>NERDCommenterToggle
"switch comment style
nmap <leader>ca <plug>NERDCommenterAltDelims
"set c default delimiter // not /**  */
let g:NERDAltDelims_c = 1


"about gitgutter
"disable default key
let g:gitgutter_map_keys = 0
"exceeded maximum number of signs,default = 500
let g:gitgutter_max_signs = 3000
"jump between hunks
nmap ]n <Plug>(GitGutterNextHunk)
nmap [n <Plug>(GitGutterPrevHunk)


"about Gina
"Gina diff
nmap <leader>gd :Gina diff<CR>
"Gina status
nmap <leader>gs :Gina status<CR>
"Gina commit
nmap <leader>gc :Gina commit<CR>
"Gina log
nmap <leader>gl :Gina log<CR>


"about startify
"dont allow startify change to dir when open a file
let g:startify_change_to_dir = 0


"about rainbow
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle


"vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


"CtrlP
"ctrlpline
nmap <leader>sf :CtrlPLine<CR>
"Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
"chang mapping to invoke CtrlP
let g:ctrlp_map = '<leader>ff'
"Use this to customize the mappings inside CtrlP's prompt to your liking. You only need to keep the lines that you've changed the values (inside []) 
let g:ctrlp_prompt_mappings = {
  \ 'PrtBS()':              ['<bs>', '<c-]>'],
  \ 'PrtDelete()':          ['<del>'],
  \ 'PrtDeleteWord()':      ['<c-w>'],
  \ 'PrtClear()':           ['<c-u>'],
  \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
  \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
  \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
  \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
  \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
  \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
  \ 'PrtHistory(-1)':       ['<c-n>'],
  \ 'PrtHistory(1)':        ['<c-p>'],
  \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
  \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
  \ 'AcceptSelection("t")': ['<c-t>'],
  \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
  \ 'ToggleFocus()':        ['<s-tab>'],
  \ 'ToggleRegex()':        ['<c-r>'],
  \ 'ToggleByFname()':      ['<c-d>'],
  \ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
  \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
  \ 'PrtExpandDir()':       ['<tab>'],
  \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
  \ 'PrtInsert()':          ['<c-\>'],
  \ 'PrtCurStart()':        ['<c-a>'],
  \ 'PrtCurEnd()':          ['<c-e>'],
  \ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
  \ 'PrtCurRight()':        ['<c-l>', '<right>'],
  \ 'PrtClearCache()':      ['<F5>'],
  \ 'PrtDeleteEnt()':       ['<F7>'],
  \ 'CreateNewFile()':      ['<c-y>'],
  \ 'MarkToOpen()':         ['<c-z>'],
  \ 'OpenMulti()':          ['<c-o>'],
  \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
  \ }


"sandwich
let g:sandwich_no_default_key_mappings = 1
silent! nmap <unique><silent> gd <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
silent! nmap <unique><silent> gr <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
silent! nmap <unique><silent> gdb <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
silent! nmap <unique><silent> grb <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)

let g:operator_sandwich_no_default_key_mappings = 1
" add
silent! map <unique> <Leader>sa <Plug>(operator-sandwich-add)
" delete
silent! xmap <unique> <Leader>sd <Plug>(operator-sandwich-delete)
" replace
silent! xmap <unique> <Leader>sr <Plug>(operator-sandwich-replace)


"color scheme
colorscheme gruvbox
set background=dark

"enable syntax
syntax enable

