" Use Vim settings, rather then Vi settings. Must be first, because it changes
" other options as a side effect.
set nocompatible

""""" PLUGINS
" Bootstrap the plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'vim-ruby/vim-ruby'
Plug 'Shadowsith/vim-ruby-autocomplete'
" Plug 'ngmy/vim-rubocop'
Plug 'tpope/vim-fugitive'
Plug 'davidhalter/jedi-vim', { 'for': 'ruby' }
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'SirVer/ultisnips'
Plug 'junegunn/seoul256.vim'
" Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'godlygeek/tabular'
Plug 'chr4/nginx.vim'
" Plug 'elzr/vim-json', { 'for': 'json' }
" Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" Plug 'junegunn/limelight.vim', { 'for': 'markdown' }
" Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim', { 'for': ['html', 'css'] }
Plug 'rhysd/vim-grammarous'
Plug 'pangloss/vim-javascript'
Plug 'moll/vim-node'
Plug 'digitaltoad/vim-pug'
" Plug 'sbdchd/neoformat'
Plug 'kchmck/vim-coffee-script'
Plug 'vim-scripts/CycleColor'
Plug 'mbbill/undotree'

call plug#end()


""""" CONFIG

" Make , the default shortcut key. This allows us to easily add custom
" key mappings later on without breaking any of Vim's default functionality.
let mapleader=","


""""" PLUGIN CONFIG
" syntastic
hi SpellBad guibg=#008080
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_css_checkers = ['csslint']
let g:syntastic_html_checkers = ['tidy']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_markdown_checkers = ['mdl']
let g:syntastic_pug_checkers = ['pug_lint']
let g:syntastic_rst_checkers = ['rstcheck']
let g:syntastic_sql_checkers = ['sqlint']
let g:syntastic_stylus_checkers = ['stylint']
let g:syntastic_zsh_checkers = ['zsh']
let g:syntastic_quiet_messages = {'level': 'warnings'}

" airline
let g:airline_theme='simple'

" NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

" utilsnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" vim-markdown
" set conceallevel=2
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2

" limelight
let g:limelight_conceal_ctermfg = 'DarkGray'
nmap <Leader>l <Plug>(Limelight)
xmap <Leader>l <Plug>(Limelight)

" goyo
nnoremap <leader>W :Goyo<cr>

" javascript
let g:javascript_plugin_jsdoc = 1

" neoformat
let g:neoformat_enabled_html = ['prettydiff']
let g:neoformat_html_prettydiff = {
        \ 'exe': 'prettydiff',
        \ 'args': ['mode:"beautify"',
        \ 'lang:"html"',
        \ 'insize:"2"',
        \ 'quote:"true"',
        \ 'quoteConvert:"double"',
        \ 'objsort:"all"',
        \ 'preserve:"1"',
        \ 'readmethod:"filescreen"',
        \ 'endquietly:"quiet"',
        \ 'source:"%:p"'],
        \ 'no_append': 1
        \ }

"fzf
set rtp+=/usr/local/opt/fzf

""""" GLOBAL SETTINGS
" Enable buffer switching without saving
set hidden

" Tabs => 2 spaces
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" Disable swap files
" set noswapfile

" Enable syntax highlighting
syntax on

" Enable line numbers
set nu

" Enable backspace in insert mode
set backspace=indent,eol,start

" Store lots of history
set history=1000

" Show incomplete commands
set showcmd

" Reload files changed outside vim
set autoread

" Display unprintable chars
set list

" " Make tabs, trailing whitespace, and EOL characters visible
" set listchars=tab:▸\ ,trail:·,eol:¬

" Find the next match as we're typing the search term
set incsearch

" Search by case only if specified
set smartcase

" Highlight searches
set hlsearch

" Allow caseless searches
set ignorecase

" Store all change info
set undodir=~/.vim/undodir

" Write changes to the undo file
set undofile

" Allow a lot of undos
set undolevels=1000
set undoreload=10000

" Enable filetype-specific configs
filetype plugin indent on

" Min number of lines to keep above and below the cursor
set scrolloff=8

" Min number of columns to keep left and right of the cursor
set sidescrolloff=15

" Min number of columns to scroll horizontally
set sidescroll=8

" disable folding
set nofoldenable

" disable line splitting
set formatoptions=

" prevent new line after 80 characters in markdown
autocmd BufRead,BufNewFile   *.md setlocal textwidth=0 wrapmargin=0

" Disable 'Ex' mode completely.
map Q <Nop>

" rubocop correction in Vim
nmap <Leader>ra :%!rubocop-correct<CR>

" fzf shortcusts
nmap <Leader>b :Buffers<CR>
nmap <Leader>t :Files<CR>

" Ag shortcut
nmap <leader>ag :Ag<CR>

" set formatting to js (prevent stupid highlighting)
nmap <leader>js :set filetype=javascript<CR>

" UndoTree config
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_DiffAutoOpen = 0
nmap <leader>u :UndotreeToggle<CR>

" Automatically reload Vim when the config changes
augroup reloadvim
  au!
  au BufWritePost .vimrc source $MYVIMRC
augroup end

""""""""""""""
" tmux fixes "
""""""""""""""
" Handle tmux $TERM quirks in vim
if $TERM =~ '^screen-256color'
    map <Esc>OH <Home>
    map! <Esc>OH <Home>
    map <Esc>OF <End>
    map! <Esc>OF <End>
endif


autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2
