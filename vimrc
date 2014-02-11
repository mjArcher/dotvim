call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set tabstop=4
set shiftwidth=4
set nocompatible ruler laststatus=2 showcmd showmode number
set incsearch ignorecase smartcase hlsearch
set shortmess+=I

set t_Co=256 "set 256 colours"
colorscheme molokai
"colorscheme grb256
"colorscheme wombat
"colorscheme elflord

"Key mappings
"NERD mappings - this doesn't seem to be working
filetype plugin on 

"Keep all temporary and backup files in one place
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

"intelligent comments"
set comments=sl:/*,mb:\ *,elx:\ */  
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

