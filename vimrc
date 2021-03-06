"Hello determine start up time 
" vim --startuptime vim.log
" time vim +:q
"pathogen
call pathogen#infect() 
" call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" set command history
set history=1000

"basic appearance
set tabstop=2
set shiftwidth=2
set nocompatible ruler laststatus=2 showcmd showmode number
set incsearch ignorecase smartcase hlsearch
set shortmess+=I
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2
set ts=2
set t_Co=256 "set 256 colours"

" colorscheme smyck
" working correct
colorscheme jellybeans
" set background=none

set encoding=utf-8

" disable certain plugins
" let g:pathogen_disabled = ["airline"]
" Enable vim-airline
" airline customisations
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" let g:airline_section_y       "(fileencoding, fileformat)

" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '◀' 
" let g:airline#extensions#tabline#left_sep = '>'
" let g:airline#extensions#tabline#left_alt_sep = '|'

" let g:airline_theme             = 'powerlineish'
" let g:airline_theme             = 'kolor'
let g:airline_theme             = 'laederon'
" 
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1
let g:airline#extensions#whitespace#trailing_format = 'trailing[%s]'
let g:airline_detect_whitespace = 0

" indent for different filetypes (required by markdown-folding)
filetype plugin indent on

" automatic indentation
filetype indent on 

set smartindent

" enable copying of stuff
set mouse=a

" change what happens when vi is closed 
set t_ti=""

" Plugin 'syntax/gnuplot.vim'

" fortran stuff
" shift+F to set syntax to fortran
"
nmap <M-F> :set syntax=fortran<CR>:let b:fortran_fixed_source=!b:fortran_fixed_source<CR>:set syntax=text<CR>:set syntax=fortran<CR>
nmap <M-C> :set syntax=cpp<CR>
nmap <M-S> :set syntax=sh<CR>
nmap <C-F> :filetype detect<CR>

" turns the spell checker on when a tex file is being modified
autocmd FileType tex setlocal spell spelllang=en_gb

" fix meta-keys which generate <Esc>a .. <Esc>z
let c='a'
while c <= 'z'
  exec "set <M-".toupper(c).">=\e".c
  exec "imap \e".c." <M-".toupper(c).">"
  let c = nr2char(1+char2nr(c))
endw

let fortran_do_enddo=3
let fortran_more_precise=3
syntax enable

let s:extfname = expand("%:e")
if s:extfname ==? "f90"
  let fortran_free_source=1
  unlet! fortran_fixed_source
else
  let fortran_fixed_source=1
  unlet! fortran_free_source
endif

let fortran_do_enddo=1
let fortran_more_precise=1
let fortran_have_tabs=1

set cursorline

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

set noswapfile
set nobackup

" :hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" :hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" :nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>


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
"
" open in new 
let NERDTreeMapOpenInTab='<ENTER>'
let NERDTreeMapOpenInTab='\r'
let g:NERDTreeDirArrows=1
if &termencoding !=# 'utf-8' 
  let NERDTreeDirArrows = 0 
endif 
"the follwing line sync NERD to current directory
 map <leader>r :NERDTreeFind<cr> 

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
nnoremap gm :call cursor(0, len(getline('.'))/2)<cr> 
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
" autocmd FileType mat set commentstring=%\
autocmd FileType gnuplot set commentstring=#\ %s " this now works !

autocmd FileType matlab set commentstring=%\ %s " this now works !

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

" paste in vim without moving the cursor
noremap p p`[

" binding to centre screen by pressing space
nmap <space> zz

" binding to toggle line numbers
nmap <C-N><C-N> :set invnumber<CR>
" remapping search so that it centres on the middle of the screen
nmap n nzz
nmap N Nzz

" current time 
nmap <F2> :echo 'Current time is ' . strftime('%c')<CR>
nmap <C-P> :echo expand('%:p') <CR>

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
"
highlight Normal guibg=none ctermbg=none
highlight NonText ctermbg=none

" function ShowSpaces(...)
"   let @/='\v(\s+$)|( +\ze\t)'
"   let oldhlsearch=&hlsearch
"   if !a:0
"     let &hlsearch=!&hlsearch
"   else
"     let &hlsearch=a:1
"   end
"   return oldhlsearch
" endfunction

" command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
" nnoremap <F12>     :ShowSpaces 1<CR>
