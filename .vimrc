syntax on
set number
set hlsearch
set laststatus=2

set cursorline
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" Indentation and spaces per tab.
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

execute pathogen#infect()

" Load key maps
source ~/.vim/maps/ctrlp_maps.vim 
source ~/.vim/maps/cscope_maps.vim 

