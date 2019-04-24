set nocompatible              " be iMproved, required

" remove all existing autocmds
autocmd!

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
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
" Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'rust-lang/rust.vim'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
" Plugin 'vim-scripts/vim-auto-save'
Plugin 'tpope/vim-bundler'
Plugin 'guns/vim-clojure-static'
Plugin 'elixir-lang/vim-elixir'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
" Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
" Plugin 'thoughtbot/vim-rspec'
Plugin 'vim-ruby/vim-ruby'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
" Plugin 'mattn/emmet-vim'
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'powerline/powerline'
Plugin 'benmills/vimux'
Plugin 'christoomey/vim-tmux-navigator'
" Plugin 'christoomey/vim-tmux-runner'
" Plugin 'fatih/vim-go'
" Plugin 'valloric/youcompleteme'
" Plugin 'easysid/mod8.vim'
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" =================
" Bundles
" Bundle 'tpope/vim-fugitive'

set backspace=indent,eol,start
set laststatus=2
" toggle paste
set pastetoggle=<F2>

" set clipboard=unnamed
set clipboard+=unnamedplus

" enable mouse
set mouse=a

" Auto Save
" let g:auto_save = 1

" ===============
" Ruby Stuff
" ==============
"execute pathogen#infect()
syntax on                 " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype plugin on    " Enable filetype-specific plugins
filetype plugin indent on " Enable filetype-specific indenting and plugins
set number
set history=10000
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set incsearch
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

set guifont=Inconsolata\ for\ Powerline:h15
set guifont=Liberation\ Mono\ for\ Powerline\ 10
let g:Powerline_symbols = 'unicode'
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

" =============
"
" status line
" ==============
:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

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

" don't want vim-gitgutter to set up any mappings at all
let g:gitgutter_map_keys = 0

let g:gitgutter_eager = 0
let g:gitgutter_realtime = 0

" autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
" autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
" autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

augroup myfiletypes
 " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml setlocal ai sw=2 sts=2 et
  autocmd FileType ruby,eruby,yaml setlocal path+=lib

  " Return to last edit position when opening files (You want this!)'
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Expand tabs in Go.
  autocmd! FileType go set sw=4 sts=4 expandtab | retab

  " javascript
  autocmd! FileType javascript set sw=2 sts=2 expandtab autoindent smartindent nocindent

  " Don't syntax highlight markdown because it's often wrong
  autocmd! FileType mkd setlocal syn=off

  " *.md is markdown
  autocmd! BufNewFile,BufRead *.md setlocal ft=

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

"map <Leader>y "+y
map <C-c> "+y


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

" let g:rspec_command = "VtrSendCommandToRunner! rspec {spec}"

" RSpec
" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>

" Auto HighLighting
nmap <Leader>* :SearchAutoHighlighting<CR>
map <Leader>*r :NoSearchAutoHighlighting<CR>

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Search and replace with confirmation
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RSpec
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"function! MapCR()
  "nnoremap <cr> :call RunNearestTest()<cr>
"endfunction
"call MapCR()
nnoremap <leader>s :call RunNearestTest()<cr>
nnoremap <leader>t :call RunTestFile()<cr>
nnoremap <leader>a :call RunTests('')<cr>

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Are we in a test file?
    let in_test_file = match(expand("%"), '\(_spec.rb\|_test.rb\|test_.*\.py\|_test.py\)$') != -1

    " Run the tests for the previously-marked file (or the current file if
    " it's a test).
    if in_test_file
        call SetTestFile(command_suffix)
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number)
endfunction

function! SetTestFile(command_suffix)
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@% . a:command_suffix
endfunction

function! RunTests(filename)
    " Write the file and run tests for the given filename
    if expand("%") != ""
      :w
    end
    " The file is executable; assume we should run
    if executable(a:filename)
      exec ":!./" . a:filename
    " Project-specific test script
    elseif filereadable("bin/test")
      exec ":!bin/test " . a:filename
    " Rspec binstub
    elseif filereadable("bin/rspec")
      exec ":!bin/rspec " . a:filename
    " Fall back to the .test-commands pipe if available, assuming someone
    " is reading the other side and running the commands
    elseif filewritable(".test-commands")
      let cmd = 'rspec --color --format progress --require "~/lib/vim_rspec_formatter" --format VimFormatter --out tmp/quickfix'
      exec ":!echo " . cmd . " " . a:filename . " > .test-commands"

      " Write an empty string to block until the command completes
      sleep 100m " milliseconds
      :!echo > .test-commands
      redraw!
    " Fall back to a blocking test run with Bundler
    elseif filereadable("bin/rspec")
      exec ":!bin/rspec --color " . a:filename
    elseif filereadable("Gemfile") && strlen(glob("spec/**/*.rb"))
      exec ":!bundle exec rspec --color " . a:filename
    elseif filereadable("Gemfile") && strlen(glob("test/**/*.rb"))
      exec ":!bin/rails test " . a:filename
    " If we see python-looking tests, assume they should be run with Nose
    elseif strlen(glob("test/**/*.py") . glob("tests/**/*.py"))
      exec "!nosetests " . a:filename
    end
endfunction



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Selecta Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
    " Escape spaces in the file name. That ensures that it's a single argument
    " when concatenated with vim_command and run with exec.
    let selection = substitute(selection, ' ', '\\ ', "g")
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

function! SelectaFile(path, glob, command)
  call SelectaCommand("find " . a:path . "/* -type f -and -not -path '*/node_modules/*' -and -not -path '*/_build/*' -and -iname '" . a:glob . "' -and -not -iname '*.pyc' -and -not -ipath '*/tmp/*' -and -not -iname '*.png' -and -not -iname '*.jpg' -and -not -iname '*.eps' -and -not -iname '*.pdf' -and -not -iname '*.svg' -and -not -iname '*.ttf'", "", a:command)
endfunction

nnoremap <leader>f :call SelectaFile(".", "*", ":edit")<cr>
nnoremap <leader>gv :call SelectaFile("app/views", "*", ":edit")<cr>
nnoremap <leader>gc :call SelectaFile("app/controllers", "*", ":edit")<cr>
nnoremap <leader>gm :call SelectaFile("app/models", "*", ":edit")<cr>
nnoremap <leader>gh :call SelectaFile("app/helpers", "*", ":edit")<cr>
nnoremap <leader>gl :call SelectaFile("lib", "*", ":edit")<cr>
nnoremap <leader>gp :call SelectaFile("public", "*", ":edit")<cr>
nnoremap <leader>gsp :call SelectaFile("spec", "*", ":edit")<cr>
nnoremap <leader>gs :call SelectaFile("app/assets/stylesheets", "*.sass", ":edit")<cr>
nnoremap <leader>e :call SelectaFile(expand('%:h'), "*", ":edit")<cr>
nnoremap <leader>v :call SelectaFile(expand('%:h'), "*", ":view")<cr>

"Fuzzy select
function! SelectaIdentifier()
  " Yank the word under the cursor into the z register
  normal "zyiw
  " Fuzzy match files in the current directory, starting with the word under
  " the cursor
  call SelectaCommand("find * -type f", "-s " . @z, ":e")
endfunction
nnoremap <c-g> :call SelectaIdentifier()<cr>

" comment lines
vnoremap <Leader>cc :NERDComComment
vnoremap <Leader>cu :NERDComUnCommentLine
vnoremap <Leader>c  :NERDComToggleComment

imap <S-CR> <CR><CR>end<Esc>-cc

highlight clear SignColumn

" key mappings for vim-tmux-runner
" let g:VtrUseVtrMaps = 1

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" will open a tmux pane on the right, occupying 50% of the screen, and start
" ruby's irb REPL.
" nnoremap <leader>irb :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'irb'}<cr>
" nnoremap <leader>rc :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'rc'}<cr>

" open pane to run specs
" nnoremap <leader>sa :VtrOpenRunner {'orientation': 'v', 'percentage': 30}<cr>

" RPROMPT="[%b%F{green}\$($HOME/.rvm/bin/rvm-prompt)%b%f]"

