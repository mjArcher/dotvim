"pathogen
call pathogen#infect() 
"call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"basic appearance
set tabstop=2
set shiftwidth=2
set nocompatible ruler laststatus=2 showcmd showmode number
set incsearch ignorecase smartcase hlsearch
set shortmess+=I
set ts=2
set t_Co=256 "set 256 colours"
colorscheme molokai
"dark
" syntax enable
" set background=dark
" colorscheme solarized

"light
" syntax enable
" set background=light
" colorscheme solarized

"colorscheme grb256
" colorscheme wombat
" colorscheme elflord

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

" keybindings for windowswap 

let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
