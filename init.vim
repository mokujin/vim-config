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
set timeoutlen=500          " timeout for leader key
set mouse=a                 " mouse support
set autoread                " reload files changed outside vim
set showmode                " show current mode down the bottom
set hidden                  " hide buffers with unsaved changes instead of asking to save changes or splitting window
set relativenumber          " relative line numbers

filetype plugin indent on   " allows auto-indenting depending on file type
syntax on                   " syntax highlighting

" double escape to reset search highlight
nnoremap <silent> <Esc><Esc> :let @/=""<CR> 

" remap exit from terminal mode to EscEsc in quick succession
tnoremap <Esc><Esc> <C-\><C-n>

" sroll on Ctrl+J/Ctrl+K
nnoremap <C-j> <C-y>
nnoremap <C-k> <C-e>

" change vertical split ratio with Ctrl-l, Ctrl-h
nnoremap <C-l> :vertical resize +1<CR>
nnoremap <C-h> :vertical resize -1<CR>

" jump to previous/next place visited with Alt-j, Alt-k
nnoremap <A-k> <C-O> 
nnoremap <A-j> <C-I> 

" jump to begin/end of line with HL
nnoremap H ^
nnoremap L $

" map commands to work with capital letters as well to prevent accidental typos
command! WQ wq
command! Wq wq
command! W w
command! Q q

" easy shortcut to command input mode. Same key without pressing shift
" UPDATE: this won't work, because ; is mapped to jump to next match in line
" when using F or f to jump to symbol
" nnoremap ; :

" remap Alt+i to switch between two recent buffers
nnoremap <A-i> :b#<CR>

" repeat last executed command with Ctrl+.
nnoremap <C-.> :<UP><CR>

" SPACE becomes a leader key
nnoremap <SPACE> <Nop>
let mapleader=" "

" remap space w [hjkl] to switch windows
nmap <silent> <leader>wk :wincmd k<CR>
nmap <silent> <leader>wj :wincmd j<CR>
nmap <silent> <leader>wh :wincmd h<CR>
nmap <silent> <leader>wl :wincmd l<CR>

" toggle NERDTree 
nnoremap <silent> <leader>f :NERDTreeToggle<CR>
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

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
hi AutoHighlightGroup guibg=#504945
let AutoHighlight = matchadd("AutoHighlightGroup", "")
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>

function! ChangeAutoHighlight()
    for m in filter(getmatches(), { i, v -> l:v.group is? 'AutoHighlightGroup' })
        call matchdelete(m.id)
    endfor
    let AutoHighlight = matchadd("AutoHighlightGroup", expand('<cword>'))
endfunction

function! ClearAutoHighlight()
    for m in filter(getmatches(), { i, v -> l:v.group is? 'AutoHighlightGroup' })
        call matchdelete(m.id)
    endfor
endfunction

function! AutoHighlightToggle()
    if exists('#auto_highlight')
        au! auto_highlight
        augroup! auto_highlight
        setl updatetime=4000
        call ClearAutoHighlight()
        echo 'Highlight current word: off'
        return 0
    else
        augroup auto_highlight
            au!
            au CursorHold * call  ChangeAutoHighlight()
        augroup end
        setl updatetime=100
        echo 'Highlight current word: ON'
        return 1
    endif
endfunction
