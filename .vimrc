syntax on
set number
set hlsearch
set cursorline
set laststatus=2

hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

execute pathogen#infect()

" Load key maps
source ~/.vim/maps/ctrlp_maps.vim 
source ~/.vim/maps/cscope_maps.vim 

