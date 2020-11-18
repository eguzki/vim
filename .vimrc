"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: Eguzki Astiz Lezaun
"
"
" Version: 1.6 - Nov 2020
"
" Sections:
"    -> General
"    -> Colors and Fonts
"    -> Files, backups and undo
"    -> Text, tab and indent related
"    -> Visual mode related
"
" Plugins_Included:
"
"       > Vundle - https://github.com/gmarik/vundle
"           Vundle is short for Vim bundle and is a Vim plugin manager.
"
"       > NERD tree - https://github.com/scrooloose/nerdtree
"           Vundle is short for Vim bundle and is a Vim plugin manager.
"
"       > EasyMotion - https://github.com/Lokaltog/vim-easymotion
"           EasyMotion provides a much simpler way to use some motions in vim.
"
"       > surround.vim - https://github.com/tpope/vim-surround
"           Makes it easy to work with surrounding text:
"            info -> :help surround
"
"       > Syntastic - https://github.com/scrooloose/syntastic
"           Syntastic is a syntax checking plugin that runs files through
"           external syntax checkers and displays any resulting errors to the
"           user
"           info -> :help syntastic-checker-options
"
"       > Command-T - https://github.com/wincent/Command-T
"            Extremely fast, intuitive mechanism for opening files with a minimal number of keystrokes
"            info -> :help command-t
"
"       > ListToggle - https://github.com/Valloric/ListToggle
"           A vim plugin for toggling the display of the quickfix list and the
"           location-list
"
"       > Vim-Airline - https://github.com/bling/vim-airline
"           lean & mean status/tabline for vim that's light as air
"
"       > EasyAlign - https://github.com/junegunn/vim-easy-align
"           A simple, easy-to-use Vim alignment plugin.
"
"       > nova-vim - https://github.com/trevordmiller/nova-vim
"           Terminal mode color schemes
"
"       > Easygrep - https://github.com/dkprice/vim-easygrep
"           Fast and Easy Find and Replace Across Multiple Files
"
"       > vim-gitgutter - https://github.com/airblade/vim-gitgutter
"           shows a git diff in the 'gutter' (sign column)
"
" "
" "
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700
" Set to auto read when a file is changed from the outside
set autoread
set expandtab
set nowrap
" always show line numbers
set number
" ignore case when searching
set ignorecase
" ignore case if search pattern is all lowercase,
"                   "    case-sensitive otherwise
set smartcase

map <F2> :NERDTreeToggle<CR>

set pastetoggle=<F3>


" Hide default status line
set noshowmode

set shell=/bin/bash
set encoding=utf-8
set ffs=unix,dos,mac "Default file types

" toggling the cursorline
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set smartindent
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set showmatch
set hls
set incsearch
set colorcolumn=100

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" associate *.md with markdown filetype
au BufRead,BufNewFile *.md set filetype=markdown

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Yaml
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" associate *.yaml|yml with yaml filetype
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

""""""""""""""""""""""""""""""
" => Vundle
""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'wincent/Command-T'
Plugin 'Valloric/ListToggle'
Plugin 'bling/vim-airline'
Plugin 'junegunn/vim-easy-align'
Plugin 'trevordmiller/nova-vim'
Plugin 'wakatime/vim-wakatime'
Plugin 'dkprice/vim-easygrep'
Plugin 'airblade/vim-gitgutter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" "filetype plugin on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable syntax hl
syntax enable
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
colorscheme nova

""""""""""""""""""""""""""""""
" => Command-T (needs to be compiled with ruby)
""""""""""""""""""""""""""""""
let g:CommandTMaxHeight = 25
" Tab and C-i are linked to focus i don't know why...
"let g:CommandTToggleFocusMap=['<Tab>']
let g:CommandTToggleFocusMap=['<C-z>']
let g:CommandTAcceptSelectionSplitMap=['<C-i>']
set wildignore+=*.o,*.obj,.git,.hg,*.pyc
noremap <leader>y :CommandTFlush<cr>

""""""""""""""""""""""""""""""
" => Syntastic
""""""""""""""""""""""""""""""
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_yaml_checkers = ['yamllint']

""""""""""""""""""""""""""""""
" => ListToggle
""""""""""""""""""""""""""""""
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'

""""""""""""""""""""""""""""""
" => Vim-Airline
""""""""""""""""""""""""""""""
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

""""""""""""""""""""""""""""""
" => easy-align
""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""""""""""""""""""""""""""""""
" => Misc
""""""""""""""""""""""""""""""
" Keep the cursos in the middle of the screen
let &scrolloff=999-&scrolloff

" Functions for cleaning up tabs and spaces
function! RemoveTrailingSpaces()
    %s/\s\+$//e
endfunction

function! ConvertTabsToSpaces()
    %retab
endfunction
function! CleanFile()
    call ConvertTabsToSpaces()
    call RemoveTrailingSpaces()
endfunction
" Key binding \f to clean up file
nmap <silent> <leader>f <Esc>:call CleanFile()<CR>

""""""""""""""""""""""""""""""
" => Easygrep
""""""""""""""""""""""""""""""
let g:EasyGrepRecursive = 1
" use system grep
let g:EasyGrepCommand = 1
let g:EasyGrepFilesToExclude = ".git,build"
