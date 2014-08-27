"pathogen
call pathogen#infect() 
" call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"basic appearance
set tabstop=2
set shiftwidth=2
set nocompatible ruler laststatus=2 showcmd showmode number
set incsearch ignorecase smartcase hlsearch
set shortmess+=I
set ts=2
set t_Co=256 "set 256 colours"
" colorscheme smyck
colorscheme molokai
colorscheme jellybeans

" let g:gruvbox_italic=0
" set background=dark
" colorscheme gruvbox

"dark
" option name default optional ———————————————— g:solarized_termcolors= 16 | 256
" g:solarized_termtrans = 0 | 1 g:solarized_degrade = 0 | 1 g:solarized_bold = 1
" | 0 g:solarized_underline = 1 | 0 g:solarized_italic = 1 | 0
" g:solarized_contrast = “normal”| “high” or “low” g:solarized_visibility=
" “normal”| “high” or “low” ————————————————




" let g:solarized_bold=1
" let g:solarized_termcolors=256
" syntax enable
" set background=light
" colorscheme solarized

" "light
" let g:solarized_termcolors=256
" syntax enable
" set background=light
" colorscheme solarized

" colorscheme grb256
" colorscheme wombat
" colorscheme elflord
"
" hi cCustomFunc  gui=bold guifg=yellowgreen hi cCustomClass gui=reverse guifg=#00FF00

"Key mappings
"NERD mappings - this doesn't seem to be working

"Keep all temporary and backup files in one place
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

"intelligent comments"
" set comments=sl:/*,mb:\ *,elx:\ */  
"Have also installed the bundle: Commentary, use gc and variants

" Install DoxygenToolkit from http://www.vim.org/scripts/script.php?script_id=987
" This provides standard C++ documentation commenting 
"let g:DoxygenToolkit_authorName=“Matthew Archer <matt.james.archer@gmail.com>”

"let g:DoxygenToolkit_commentType = "C++"

"Key bindings  
"assigning the mapleader variable - for future <leader> mappings
let mapleader = ","

"quick directory
"type :e %%/ on the command line will expand to :e /some/path/. 
cabbr <expr> %% expand('%:p:h')

"changing vimrc after saved session
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds"

noremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
"Open new tab the firefox way 
nnoremap <C-t> :tabnew<CR>
"Change current working directory to where file exists
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
"resize splits more quickly
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif
"tab completion
set wildmode=longest,list,full
set wildmenu
"Nerdtree browser
map <F3> :NERDTreeToggle <CR>
"commentary
autocmd FileType apache set commentstring=#\ %s
autocmd FileType mat set commentstring=%\

filetype plugin on 

"allows the switching of files without the need to save
set hidden

"to read 
" 
" http://vim.wikia.com/wiki/Moving_lines_up_or_down

" keybindings for windowswap: ,yw to yank and ,pw to paste
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR> 
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>

" binding to centre screen by pressing space
nmap <space> zz

" remapping search so that it centres on the middle of the screen
nmap n nzz
nmap N Nzz

"move between vim windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
"set minimum window height to 0
set wmh=0
"alternate tab navigation
" nnoremap th  :tabfirst<CR>
" nnoremap tj  :tabnext<CR>
" nnoremap tk  :tabprev<CR>
" nnoremap tl  :tablast<CR>
" nnoremap tt  :tabedit<Space>
" nnoremap tn  :tabnext<Space>
" nnoremap tm  :tabm<Space>
" nnoremap td  :tabclose<CR>
" Alternatively use
" "nnoremap th :tabnext<CR>
" "nnoremap tl :tabprev<CR>
" "nnoremap tn :tabnew<CR>
