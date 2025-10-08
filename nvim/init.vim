" Enable true colors in the terminal (if supported)
if has("termguicolors")
	set termguicolors
endif

" Set Normal background to transparent
hi Normal guibg=NONE ctermbg=NONE guifg=#00ffff

" Disable the tilde symbol in empty lines
" Resolve fillchars for the vert data
set fillchars+=eob:\ 

" Configure the clipboard systemwide
set clipboard=unnamedplus

" Setup tabstop and stopwidth to 2
set tabstop=2
set shiftwidth=2

" Setup status data and cmdheight to non-visible
set laststatus=0
set cmdheight=0

" Configure the colorscheme and syntax
syntax off
