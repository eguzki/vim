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
"       > easy-align - https://github.com/junegunn/vim-easy-align
"           A simple, easy-to-use Vim alignment plugin.
"
"       > Zenburn - https://github.com/jnurmine/Zenburn
"           Terminal mode color schemes
"
"       > vim-python-pep8-indent - https://github.com/hynek/vim-python-pep8-indent
"           indentation behavior to comply with PEP8
"
"       > vim-go - https://github.com/fatih/vim-go
"           Go (golang) support for Vim
"
"       > tagbar - https://github.com/majutsushi/tagbar
"           displays tags in a window, ordered by scope
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
set tags+=$HOME/.vim/tags/stl
set tags+=$HOME/.vim/tags/c
"

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
set autoindent
set cindent
" associate *.md with markdown filetype
au BufRead,BufNewFile *.md set filetype=markdown
set tabstop=4
set softtabstop=4
set shiftwidth=4
set showmatch
set hls
set incsearch

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
Plugin 'Valloric/YouCompleteMe'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/syntastic'
Plugin 'wincent/Command-T'
Plugin 'Valloric/ListToggle'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'wakatime/vim-wakatime'
Plugin 'bling/vim-airline'
Plugin 'junegunn/vim-easy-align'
Plugin 'jnurmine/Zenburn'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
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
colors zenburn

""""""""""""""""""""""""""""""
" => YouCompleteMe
""""""""""""""""""""""""""""""
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <F6> :YcmCompleter GoToDefinitionElseDeclaration<CR>

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
let g:syntastic_python_checkers = ['pylint3']
"Disable annoying pylint mesages
"   C0103 Invalid constant name
"   R0903 Too few public methods (Classes aren't meant to just store datas.)
"   W0141 Used builtin function 'map'|'filter' (Why not? Nonsens!)
"   W0142 Used * or ** magic (Why not? Nonsens!)
let g:syntastic_python_pylint_post_args='--disable=C0103,R0903,W0141,W0142'
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:syntastic_yaml_checkers = ['yamllint']

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
let g:airline#extensions#tabline#enabled = 1

""""""""""""""""""""""""""""""
" => easy-align
""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
"
" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)

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
" => Vim-Go
""""""""""""""""""""""""""""""
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_bin_path = expand("~/.gotools")
let g:go_autodetect_gopath = 0
" disable fmt on save
let g:go_fmt_autosave = 0
nmap <F5> :GoDef<CR>

""""""""""""""""""""""""""""""
" => tagbar
""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>


""""""""""""""""""""""""""""""
" => Easygrep
""""""""""""""""""""""""""""""
let g:EasyGrepRecursive = 1
" use system grep
let g:EasyGrepCommand = 1
let g:EasyGrepFilesToExclude = ".git,node_modules,build"
