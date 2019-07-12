" based on https://github.com/cekrem/dotfiles/blob/master/.vimrc

" ----------------------------------------
" Automatic installation of vim-plug, if it's not available
" ----------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


"-----------------------------------------
" Automatically install missing plugins on startup
"-----------------------------------------
autocmd VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall --sync | q
      \| endif


"-----------------------------------------
" Plugins
"-----------------------------------------
silent! if plug#begin('~/.vim/plugged')

" Plug 'mattn/emmet-vim'                 " autocomplete HTML
" Plug 'w0rp/ale'                        " linting plugin
" Plug 'morhetz/gruvbox'                 " vim gruvbox color scheme
" Plug 'tpope/vim-dotenv'                " basic support for .env and Procfile
Plug 'airblade/vim-gitgutter'          " git gutter
Plug 'tpope/vim-fugitive'              " should perhaps be illegal
Plug 'tpope/vim-sensible'              " Sensible defaults ++
Plug 'tpope/vim-sleuth'                " automatically adjusts 'shiftwidth' and 'expandtab'
" Plug 'tpope/vim-unimpaired'            " mappings
" Plug 'nathanaelkane/vim-indent-guides' " Indent guides
" Plug 'majutsushi/tagbar'               " data structure
" Plug 'w0rp/ale'                        " Linting
" Plug 'scrooloose/nerdcommenter'        " [count]/c<space>
" Plug 'jiangmiao/auto-pairs'            " Bracket pairing
" Plug 'nicwest/vim-http'                " HTTP requests
" Plug 'tpope/vim-dadbod'                " :DB

" Themes
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'

" golang
" Plug 'sirver/ultisnips', { 'for': 'go' }
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }

" JavaScript and jsx
" Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'jsx'] }
" Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx', 'jsx'] }
" Plug 'galooshi/vim-import-js', { 'for': ['javascript', 'javascript.jsx', 'jsx']  }

" YAML formatting (faster)
" Plug 'stephpy/vim-yaml', { 'for': 'yaml' }

" File navigation / search
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' }
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'mileszs/ack.vim'

" tmux integration/navigation
" Plug 'christoomey/vim-tmux-navigator', { 'do': '~/utils/fix-gocode' }

call plug#end()
endif
" vim-plug does not require any extra statement other than plug#begin()
" and plug#end(). You can remove filetype off, filetype plugin indent on
" and syntax on from your .vimrc as they are automatically handled by
" plug#begin() and plug#end()
"-----------------------------------------

" General settings
set hidden
set number
set autoread
set autowrite
set noswapfile
set ignorecase
set smartcase
set splitright
set splitbelow
set noshowmode
set cursorline

" Mouse integration
set mouse=a

" Clipboard
set clipboard^=unnamed
set clipboard^=unnamedplus

" Tab settings
set expandtab     " Expand tabs to the proper type and size
set tabstop=2     " Tabs width in spaces
set softtabstop=2 " Soft tab width in spaces
set shiftwidth=2  " Amount of spaces when shifting


" Statusline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'
"let g:lightline.active = 'left': { [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ] }
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ]
      \ }
      \ }

" Colors
set background=dark
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:airline_theme='gruvbox'

colorscheme gruvbox

