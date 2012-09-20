"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: Eguzki Astiz Lezaun
"
"
" Version: 1.1 - 11/05/11 14:40:30
"
" Blog_post: 
" Syntax_highlighted:
" Raw_version: 
"
" Sections: (to be done)
"    -> General
"    -> Colors and Fonts
"    -> Files, backups and undo
"    -> Text, tab and indent related
"    -> Visual mode related
"
"    -> Minibuffer plugin
"    -> TagList
"    -> clang
"    -> Command-T
"    -> Java
"    -> Json
"    -> Misc
"
" Plugins_Included: (not completed)
"     > minibufexpl.vim -
" http://www.vim.org/scripts/script.php?script_id=159
"        Makes it easy to get an overview of buffers:
"            info -> :e ~/.vim_runtime/plugin/minibufexpl.vim
" 
"      > surround.vim - http://www.vim.org/scripts/script.php?script_id=1697
"        Makes it easy to work with surrounding text:
"            info -> :help surround
" 
"      > snipMate.vim - http://www.vim.org/scripts/script.php?script_id=2540
"        Snippets for many languages (similar to TextMate's):
"            info -> :help snipMate
" 
"      > clang.vim - http://www.vim.org/scripts/script.php?script_id=3302
"        Autocomplete C/C++ code
"
"      > a.vim - http://www.vim.org/scripts/script.php?script_id=31
"      Alternate Files quickly (.c --> .h etc) ]
" "
" "  Revisions:
" "     > 3.1: Added snipMate
" "
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
let g:snips_author = 'Eguzki Astiz Lezaun'

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
" Enable filetype plugin
filetype on
filetype plugin on
set tags+=$HOME/.vim/tags/stl
set tags+=$HOME/.vim/tags/c
" set tags+=$HOME/.vim/tags/python26.ctags
" set tags+=~/.vim/tags/gl
"

map <F2> :NERDTreeToggle<CR>

set pastetoggle=<F3>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable syntax hl
syntax enable 
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
filetype plugin indent on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set showmatch
set hls
set incsearch

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Really useful!
"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>
map <leader>g :vimgrep // **/*<left><left><left><left><left><left><left>


function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction


" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

""""""""""""""""""""""""""""""
" => clang plugin
""""""""""""""""""""""""""""""
let g:clang_complete_copen = 1

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

" Auto completion via ctrl-space (instead of the nasty ctrl-x ctrl-o)
inoremap <Nul> <C-x><C-o>
inoremap <expr> j   pumvisible()?"\<C-N>":"j"
inoremap <expr> k   pumvisible()?"\<C-P>":"k"


" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q --language-force=C++ --exclude=tags .<CR>
map <C-F11> :!ctags -R --fields=+iaS --extra=+q .<CR>

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

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
" => Java
""""""""""""""""""""""""""""""
autocmd Filetype java setlocal omnifunc=javacomplete#Complete

""""""""""""""""""""""""""""""
" => Json
""""""""""""""""""""""""""""""
autocmd BufRead *.json set filetype=json
au! Syntax json source ~/.vim/syntax/json.vim
autocmd FileType json set equalprg=json_reformat
autocmd FileType json set makeprg=jsonval\ %
autocmd FileType json set errorformat=%E%f:\ %m\ at\ line\ %l,%-G%.%#

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

" Python Compiler
autocmd FileType python compiler pylint
let g:pylint_onwrite = 0
