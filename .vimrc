"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: Eguzki Astiz Lezaun
"
"
" Version: 1.9 - Feb 2025
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
"       > Vim-Plug - https://github.com/junegunn/vim-plug
"           Vim-Plug is a minimalist Vim plugin manager.
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
"       > fzf vim - https://github.com/junegunn/fzf.vim
"           fzf is a general-purpose command-line fuzzy finder.
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
"       > vim-solarized8 - https://github.com/lifepillar/vim-solarized8
"           Terminal mode color schemes
"
"       > vim-wakatime- https://github.com/wakatime/vim-wakatime
"           automatic time tracking and metrics generated from your programming activity
"
"       > ack - https://github.com/mileszs/ack.vim
"           Run your favorite search tool from Vim, with an enhanced results list
"
"       > vim-gitgutter - https://github.com/airblade/vim-gitgutter
"           shows a git diff in the 'gutter' (sign column)
"
"       > indentLine - https://github.com/Yggdroot/indentLine
"           Displaying thin vertical lines at each indentation level for code indented with spaces
"
"       > vim-fugitive - https://github.com/tpope/vim-fugitive
"           Fugitive is the premier Vim plugin for Git
"
"       > vim-go - https://github.com/fatih/vim-go
"           Go (golang) support for Vim
"
"       > tagbar - https://github.com/preservim/tagbar
"           displays tags in a window, ordered by scope
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
set tabstop=4
set softtabstop=4
set shiftwidth=4
set showmatch
set hls
set incsearch
set colorcolumn=100


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" http://got-ravings.blogspot.com/2008/07/vim-pr0n-visual-search-mappings.html

function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

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

""""""""""""""""""""""""""""""
" => Vim-Plug
""""""""""""""""""""""""""""""
call plug#begin()

" List your plugins here

Plug 'scrooloose/nerdtree'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'Valloric/ListToggle'
Plug 'bling/vim-airline'
Plug 'junegunn/vim-easy-align'
Plug 'lifepillar/vim-solarized8'
Plug 'wakatime/vim-wakatime'
Plug 'mileszs/ack.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'preservim/tagbar'

call plug#end()

" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable syntax hl
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Color scheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
autocmd vimenter * ++nested colorscheme solarized8_high

""""""""""""""""""""""""""""""
" => fzf
""""""""""""""""""""""""""""""
nnoremap <silent> <C-f> :Files<CR>

""""""""""""""""""""""""""""""
" => Syntastic
""""""""""""""""""""""""""""""
let g:syntastic_go_checkers = ['go', 'gofmt', 'golangci_lint', 'golint']
let g:syntastic_aggregate_errors = 1
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
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#skip_indent_check_ft = {'go': ['mixed-indent-file']}

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

function! CleanFile()
    call RemoveTrailingSpaces()
endfunction
" Key binding \f to clean up file
nmap <silent> <leader>f <Esc>:call CleanFile()<CR>

""""""""""""""""""""""""""""""
" => Ack
""""""""""""""""""""""""""""""
" Options include:
" --vimgrep -> Needed to parse the ag response properly for ack.vim
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'ag --vimgrep --smart-case --hidden --ignore .git'
" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1
" Don't jump to first match
cnoreabbrev Ack Ack!
" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>/ :Ack!<Space>
" search for a current visual selection
" This solution uses the <C-r>= trick that allows you to enter a kind of second-level command-line, which allows you to enter any vimscript expression, which is then evaluated, and the result is stringified and pasted onto the (original, first-level) command-line where the cursor is.
vnoremap <Leader>/ y:Ack! <C-r>=fnameescape(@")<CR><CR>


""""""""""""""""""""""""""""""
" => indentLine
""""""""""""""""""""""""""""""
let g:indentLine_setColors = 0
let g:indentLine_char = '⦙'

""""""""""""""""""""""""""""""
" => vim-go
""""""""""""""""""""""""""""""
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_bin_path = expand("~/.gotools")
let g:go_gotags_bin = expand("~/.gotools/gotags")
let g:go_autodetect_gopath = 0
let g:go_fmt_autosave = 1
let g:go_auto_sameids = 1

""""""""""""""""""""""""""""""
" => tagbar
""""""""""""""""""""""""""""""
nmap <F4> :TagbarToggle<CR>
let g:tagbar_type_go = {
  \ 'ctagstype' : 'go',
  \ 'kinds'     : [
    \ 'p:package',
    \ 'i:imports:1',
    \ 'c:constants',
    \ 'v:variables',
    \ 't:types',
    \ 'n:interfaces',
    \ 'w:fields',
    \ 'e:embedded',
    \ 'm:methods',
    \ 'r:constructor',
    \ 'f:functions'
  \ ],
  \ 'sro' : '.',
  \ 'kind2scope' : {
    \ 't' : 'ctype',
    \ 'n' : 'ntype'
  \ },
  \ 'scope2kind' : {
    \ 'ctype' : 't',
    \ 'ntype' : 'n'
  \ },
  \ 'ctagsbin'  : expand(g:go_gotags_bin),
  \ 'ctagsargs' : '-sort -silent'
\ }
