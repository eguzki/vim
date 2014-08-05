"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: Eguzki Astiz Lezaun
"
"
" Version: 1.3 - 11th May 2013 14:40:30
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
"       > minibufexpl.vim - http://www.vim.org/scripts/script.php?script_id=159
"           Makes it easy to get an overview of buffers:
"            info -> :e ~/.vim_runtime/plugin/minibufexpl.vim
" 
"       > surround.vim - https://github.com/tpope/vim-surround
"           Makes it easy to work with surrounding text:
"            info -> :help surround
" 
"       > YouCompleteMe - https://github.com/Valloric/YouCompleteMe
"           Autocomplete Python/Java/C/C++ code
"
"       > Syntastic - https://github.com/scrooloose/syntastic
"           Syntastic is a syntax checking plugin that runs files through
"           external syntax checkers and displays any resulting errors to the
"           user
"           info -> :help syntastic-checker-options
"
"       > a.vim - http://www.vim.org/scripts/script.php?script_id=31
"           Alternate Files quickly (.c --> .h etc) ]
"
"       > Command-T - https://github.com/wincent/Command-T
"            Extremely fast, intuitive mechanism for opening files with a minimal number of keystrokes
"            info -> :help command-t 
"
"       > TagList - http://www.vim.org/scripts/script.php?script_id=273
"            Overview of the structure of source code files and allows you to efficiently browse through source code files
"            info -> :help taglist
"
"       > ListToggle - https://github.com/Valloric/ListToggle
"           A vim plugin for toggling the display of the quickfix list and the
"           location-list
"
"       > Vim-Airline - https://github.com/bling/vim-airline
"           lean & mean status/tabline for vim that's light as air
"
"       > fugitive - https://github.com/tpope/vim-fugitive
"           fugitive.vim: a Git wrapper
"
" "
" "
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
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
set tags+=$HOME/.vim/tags/stl
set tags+=$HOME/.vim/tags/c
"

map <F2> :NERDTreeToggle<CR>

set pastetoggle=<F3>


" Hide default status line
set noshowmode 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable syntax hl
syntax enable 
"if $COLORTERM == 'gnome-terminal'
"    set t_Co=256
"endif
set gfn=Monospace\ 10
set shell=/bin/bash
set encoding=utf8
set ffs=unix,dos,mac "Default file types

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
set autoindent
set smartindent
" Enable filetype plugin
filetype plugin indent on
" associate *.md with markdown filetype
au BufRead,BufNewFile *.md set filetype=markdown
set tabstop=4
set softtabstop=4
set shiftwidth=4
set showmatch
set hls
set incsearch

""""""""""""""""""""""""""""""
" => Vundle
""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/syntastic'
Bundle 'wincent/Command-T'
Bundle 'Valloric/ListToggle'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdtree'
Bundle 'wakatime/vim-wakatime'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Really useful!
"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>

" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        execute "grep -srn --binary-files=without-match --exclude=tags --exclude-dir=.hg --exclude-dir=.git . -e " . l:pattern . " "
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

""""""""""""""""""""""""""""""
" => YouCompleteMe
""""""""""""""""""""""""""""""
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

""""""""""""""""""""""""""""""
" => Minibuffer plugin
""""""""""""""""""""""""""""""
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

""""""""""""""""""""""""""""""
" => TagList
""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Use_Right_Window=1
let Tlist_WinWidth=30
let Tlist_Exit_OnlyWindow = 1
map <F4> :TlistToggle<cr>

" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q --language-force=C++ --exclude=tags .<CR>
map <C-F11> :!ctags -R --fields=+iaS --extra=+q .<CR>

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
let g:syntastic_javascript_checkers = ['jshint'] 
let g:syntastic_javascript_jshint_args = '--config $HOME/.jshintrc'
let g:syntastic_python_checkers = ['pylint']
"Disable annoying pylint mesages
"   C0103 Invalid constant name
"   R0903 Too few public methods (Classes aren't meant to just store datas.)
"   W0141 Used builtin function 'map'|'filter' (Why not? Nonsens!)
"   W0142 Used * or ** magic (Why not? Nonsens!)
let g:syntastic_python_pylint_post_args='--disable=C0103,R0903,W0141,W0142'

""""""""""""""""""""""""""""""
" => ListToogle
""""""""""""""""""""""""""""""
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'

""""""""""""""""""""""""""""""
" => Vim-Airline
""""""""""""""""""""""""""""""
set laststatus=2
let g:airline_powerline_fonts = 1

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

