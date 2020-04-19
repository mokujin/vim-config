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
set showcmd                 " show command keys while you typing
set timeoutlen=3000         " timeout for leader key
set mouse=a                 " mouse support
set autoread                " reload files changed outside vim
set showmode                " show current mode down the bottom
set hidden                  " hide buffers with unsaved changes instead of asking to save changes or splitting window
set relativenumber          " relative line numbers

filetype plugin indent on   " allows auto-indenting depending on file type
syntax on                   " syntax highlighting

" double escape to reset search highlight
nnoremap <silent> <Esc><Esc> :let @/=""<CR> 

" remap Ctrl+[hjkl] to switch windows
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>

" sroll on Ctrl+J/Ctrl+K
nnoremap <C-j> <C-y>
nnoremap <C-k> <C-e>

" jump to begin/end of line with HL
nnoremap H ^
nnoremap L $

" easy shortcut to command input mode. Same key without pressing shift
nnoremap ; :

" remap Alt+t to switch between two recent buffers
nnoremap <A-t> :b#<CR>

" SPACE becomes a leader key
nnoremap <SPACE> <Nop>
let mapleader=" "

" remap exit from terminal mode to EscEsc in quick succession
tnoremap <Esc><Esc> <C-\><C-n>

" toggle NERDTree 
nnoremap <leader>f :NERDTreeToggle<CR>
" toggle NERDTree AND select current file editing in it
nnoremap <silent> <leader>v :NERDTreeFind<CR>
" automatically delete the buffer of the file you just deleted with NERDTree
let NERDTreeAutoDeleteBuffer=1
" remove 'press ? for help'
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

nnoremap <leader>evc :e $HOME/AppData/Local/nvim/init.vim<CR>   " Edit Vim Config
nnoremap <leader>rvc :so $HOME/AppData/Local/nvim/init.vim<CR>  " Reload Vim Config

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

