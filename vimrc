set nocompatible              " be iMproved, required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
let g:autotagTagsFile=".tags"
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'craigemery/vim-autotag'
"Plugin 'vim-scripts/AutoTag'
Plugin 'vim-scripts/VimClojure'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'rust-lang/rust.vim'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'vim-scripts/vim-auto-save'
Plugin 'tpope/vim-bundler'
Plugin 'guns/vim-clojure-static'
Plugin 'elixir-lang/vim-elixir'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'thoughtbot/vim-rspec'
Plugin 'vim-ruby/vim-ruby'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'powerline/powerline'
Plugin 'benmills/vimux'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-theme'
Plugin 'mhartington/oceanic-next'
" Plugin 'valloric/youcompleteme'
" Plugin 'easysid/mod8.vim'
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" =================
" Bundles
" Bundle 'tpope/vim-fugitive'


" =============
"
" status line
" ==============
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%{fugitive#statusline()}
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

set laststatus=2
" toggle paste
set pastetoggle=<F2>

" set clipboard=unnamed
set clipboard+=unnamedplus

" enable mouse
set mouse=a

" Auto Save
let g:auto_save = 1

" ===============
" Ruby Stuff
" ==============
"execute pathogen#infect()
syntax on                 " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype plugin on    " Enable filetype-specific plugins
filetype plugin indent on " Enable filetype-specific indenting and plugins
" set relativenumber
set number
set smartindent
set nocompatible
set tabstop=2
set shiftwidth=2
set expandtab
set hlsearch
" highlight current line
set cursorline
" set guifont=Monospace:h10

"set shell=/bin/bash\ -i

set backupdir=~/vimtmp
set directory=~/vimtmp

" rebuild ctag index
:nnoremap <f5> :!ctags -R<CR>
" Set to auto read when a file is changed from the outside

set autoread

" Don't redraw while executing macros (good performance config)
set lazyredraw

" keep undo history
set hidden

" AirLine settigns
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=0

set guifont=Inconsolata\ for\ Powerline:h15
set guifont=Liberation\ Mono\ for\ Powerline\ 10
let g:Powerline_symbols = 'unicode'
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
"set term=xterm-256color
set termencoding=utf-8

"""""""""""""""""""""""
" Color Theme settings
"""""""""""""""""""""""
set t_Co=256
set background=dark
color grb256
" This line enables the true color support.
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

" Remember info about open buffers on close
set viminfo^=%

let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1

let g:NERDTreeDirArrows=0

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" Return to last edit position when opening files (You want this!)
"autocmd BufReadPost *
"    \ if line("'\") > 0 && line("'\") <= line("$") |
"    \   exe "normal! g`\"" |
"    \ endif

augroup myfiletypes
 " Clear old autocmds in group
  autocmd!
" autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml setlocal ai sw=2 sts=2 et
  autocmd FileType ruby,eruby,yaml setlocal path+=lib

" Return to last edit position when opening files (You want this!)'

augroup END

" Rails stuff

let mapleader = ","

vmap <Leader>bed "td?describe<CR>obefore :each do<CR><esc>k"tp
map <Leader>tf irequire File.dirname(__FILE__<esc>la + '/../spec_helper<esc>o<CR>describe do<CR>describe "<esc>la do<CR><esc>
map <Leader>eac :sp app/controllers/tds/application_controller.rb<cr>
map <Leader>w :w!<cr> 
map <Leader>wq :wq!<cr>
map <Leader>rr :!rake routes<cr>
" switch back and forth code and tests
map <Leader>tt :A<cr>                 
map <Leader>gb :Gblame<cr>

" tabs
map <Leader>tn :tabnext<cr>
map <Leader>tp :tabprevious<cr>
map <Leader>tab :tabnew<cr>

" omnicomplete
imap <Leader>. <C-x><C-p>

" Nerdtree
map <Leader>nt :NERDTree<cr>
let g:NERDTreeMouseMode=3

map <Leader>m :!
map <Leader>v :vsplit 
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>


" Smart way to move between windows
"map <Leader>j <C-W>j
"map <Leader>k <C-W>k
"map <Leader>h <C-W>h
"map <Leader>l <C-W>l

" ruby refactor
:nnoremap <leader>rap  :RAddParameter<cr>
:nnoremap <leader>rcpc :RConvertPostConditional<cr>
:nnoremap <leader>rel  :RExtractLet<cr>
:vnoremap <leader>rec  :RExtractConstant<cr>
:vnoremap <leader>relv :RExtractLocalVariable<cr>
:nnoremap <leader>rit  :RInlineTemp<cr>
:vnoremap <leader>rrlv :RRenameLocalVariable<cr>
:vnoremap <leader>rriv :RRenameInstanceVariable<cr>
:vnoremap <leader>rem  :RExtractMethod<cr>

" Rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Auto HighLighting
nmap <Leader>* :SearchAutoHighlighting<CR>
map <Leader>*r :NoSearchAutoHighlighting<CR>

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Search and replace with confirmation
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" comment lines
vnoremap <Leader>cc :NERDComComment
vnoremap <Leader>cu :NERDComUnCommentLine
vnoremap <Leader>c  :NERDComToggleComment

imap <S-CR> <CR><CR>end<Esc>-cc

highlight clear SignColumn
