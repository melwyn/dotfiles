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

" Auto Save
let g:auto_save = 1

" ===============
" Ruby Stuff
" ==============
execute pathogen#infect()
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
set guifont=Monospace:h10

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

" Smart way to move between windows
"map <Leader>j <C-W>j
"map <Leader>k <C-W>k
"map <Leader>h <C-W>h
"map <Leader>l <C-W>l


" Remember info about open buffers on close
set viminfo^=%

let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1

set runtimepath^=~/.vim/bundle/ctrlp.vim
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

map <Leader>eac :sp app/controllers/tds/application_controller.rb<cr>
map <Leader>w :w!<cr> 
map <Leader>wq :wq!<cr>
map <Leader>rr :!rake routes<cr>
" switch back and forth code and tests
map <Leader>tt :A<cr>                 


" Nerdtree
map <Leader>nt :NERDTree<cr>

map <Leader>m :!
map <Leader>v :vsplit 
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>


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

