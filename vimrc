call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set tabstop=4
set shiftwidth=4
set nocompatible ruler laststatus=2 showcmd showmode number
set incsearch ignorecase smartcase hlsearch
set shortmess+=I

set t_Co=256 "set 256 colours"
"colorscheme molokai
"colorscheme grb256
"colorscheme wombat
colorscheme elflord

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


