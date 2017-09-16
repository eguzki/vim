"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: Eguzki Astiz Lezaun
"
"
" Version: 1.8 - Oct 2023
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
"       > vim-ruby - https://github.com/vim-ruby/vim-ruby
"           Vim/Ruby Configuration Files
"
"       > endwise - https://github.com/tpope/vim-endwise
"           Helps to end certain structures automatically
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
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'Valloric/ListToggle'
Plugin 'bling/vim-airline'
Plugin 'junegunn/vim-easy-align'
Plugin 'lifepillar/vim-solarized8'
Plugin 'wakatime/vim-wakatime'
Plugin 'mileszs/ack.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'Yggdroot/indentLine'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'

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
let g:syntastic_ruby_checkers = ['rubocop']
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
" => vim-ruby
""""""""""""""""""""""""""""""
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_load_gemfile = 1
