set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set tabstop=4               " number of columns occupied by a tab character
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=120                  " set an 80 column border for good coding style
set encoding=utf-8          " utf8 encoding in files
set clipboard=unnamedplus   " yank to system clipboard as well

filetype plugin indent on   " allows auto-indenting depending on file type
syntax on                   " syntax highlighting
nnoremap <silent> <Esc><Esc> :let @/=""<CR>

" remap Ctrl+[hjkl] to switch windows
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

"----------- plugins ----------------
"
call plug#begin()

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
        let g:airline_powerline_fonts = 1

    Plug 'morhetz/gruvbox'                  " general theme
        set background=dark " use dark mode. [light, dark]
        let g:airline_theme='gruvbox'
        let g:gruvbox_invert_selection = 0
        let g:gruvbox_contrast_dark='medium'
        let g:gruvbox_contrast_light='medium'
    Plug 'ryanoasis/vim-devicons'

    Plug 'tpope/vim-surround'
    Plug 'scrooloose/nerdtree'

call plug#end()

colorscheme gruvbox

