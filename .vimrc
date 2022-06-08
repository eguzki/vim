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
"       > rust.vim - https://github.com/rust-lang/rust.vim
"           Plugin that provides Rust file detection, syntax highlighting, formatting, Syntastic integration, and more. Fugitive is the premier Vim plugin for Git
"
"       > tagbar - https://github.com/preservim/tagbar
"           displays tags in a window, ordered by scope
"
"       > coc - https://github.com/neoclide/coc.nvim
"           plugin for completion
"
"       > ale - https://github.com/dense-analysis/ale
"           ALE (Asynchronous Lint Engine) is a plugin providing linting
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
Plug 'rust-lang/rust.vim'
Plug 'preservim/tagbar'
Plug 'neoclide/coc.nvim'
Plug 'dense-analysis/ale'

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
" => rust.vim
""""""""""""""""""""""""""""""
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

""""""""""""""""""""""""""""""
" => coc
""""""""""""""""""""""""""""""

" https://github.com/neoclide/coc.nvim
"
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

""""""""""""""""""""""""""""""
" => tagbar
""""""""""""""""""""""""""""""
nmap <F4> :TagbarToggle<CR>
