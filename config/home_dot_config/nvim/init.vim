"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
if has('vim_starting')
  set nocompatible               " Be iMproved
endif

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

let g:vim_bootstrap_langs = "javascript,php,python,go,c"
let g:vim_bootstrap_editor = "nvim"				" nvim or vim

if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif
" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'scrooloose/nerdtree'
" Plug 'jistr/vim-nerdtree-tabs'
" Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer --clang-tidy --go-completer --ts-completer --system-libclang'}
Plug 'tpope/vim-fugitive'
" Plug 'klen/python-mode'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/grep.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" For JavaScript Development
Plug 'tpope/vim-commentary'

" Plug 'prettier/vim-prettier'
Plug 'pangloss/vim-javascript'
" Plug 'dense-analysis/ale'
Plug 'posva/vim-vue'
Plug 'ap/vim-css-color'


"*****************************************************************************
" Color Themes
"*****************************************************************************
Plug 'gruvbox-community/gruvbox'
" Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'jacoborus/tender.vim'
Plug 'kyoz/purify', {'rtp': 'vim'}
Plug 'sonph/onehalf', {'rtp': 'vim/'}


let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif


"*****************************************************************************
" Include user's extra bundle
"*****************************************************************************
if filereadable(expand("~/.config/nvimrc.local.bundles"))
  source ~/.config/nvimrc.local.bundles
endif

call plug#end()

" Required:
filetype plugin indent on


"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set wrap


"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number

let no_buffers_menu=1
if !exists('g:not_finish_vimplug')
  " colorscheme gruvbox
  colorscheme purify
  " colorscheme onehalfdark
  " colorscheme tender
  " colorscheme one
 endif
set background=dark


set t_Co=256
" set guioptions=egmrti
" set guifont=Courier\ New\ 9 
set guifont=SF\ Mono\ 10 

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
" set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" vim-airline
" let g:airline_theme = 'powerlineish'
" let g:airline_theme = 'one'
let g:airline_theme = 'purify'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" NERDTree configuration
map <F4> :NERDTreeToggle<CR>

set guitablabel=\[%N\]\ %t\ %M

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'


"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync fromstart
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread

"*****************************************************************************
" Disable visualbell
"*****************************************************************************
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif


"*****************************************************************************
"" Custom configs
"*****************************************************************************
" vim-javascript plugin
let g:javascript_plugin_jsdoc = 1

nnoremap <F5> :CocCommand prettier.formatFile <CR>

" vim-airline
let g:airline#extensions#virtualenv#enabled = 1

" ale plugin for javascript
" let g:ale_linters = {
" \   'python': ['flake8', 'pylint'],
" \   'javascript': ['eslint'],
" \   'vue': ['eslint']
" \}

" let g:ale_fixers = {
  " \    'javascript': ['eslint'],
  " \    'typescript': ['prettier', 'tslint'],
  " \    'vue': ['eslint'],
  " \    'scss': ['prettier'],
  " \    'html': ['prettier'],
  " \    'reason': ['refmt']
" \}
" let g:ale_fix_on_save = 1
" nnoremap ]r :ALENextWrap<CR>     " move to the next ALE warning / error
" nnoremap [r :ALEPreviousWrap<CR> " move to the previous ALE warning / error

"*****************************************************************************
"*****************************************************************************
"" Include user's local vim config
if filereadable(expand("~/.config/nvimrc.local"))
  source ~/.config/nvimrc.local
endif

"*****************************************************************************
"" Convenience variables
"*****************************************************************************
" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

syntax enable                   "Use syntax highlighting
let g:airline#extensions#tabline#enabled = 1

"" set default identation
set tabstop=2
set shiftwidth=2
set expandtab
set laststatus=2
" set linespace=4
set smartindent


" Vim YCM Comments
" let g:ycm_complete_in_comments =
" \ get( g:, 'ycm_complete_in_comments', 0 )

" let g:ycm_autoclose_preview_window_after_completion =
" \ get( g:, 'ycm_autoclose_preview_window_after_completion', 1 )

" Vim Vue plugin
" let g:vue_disable_pre_processors=1
let g:vue_pre_processors = []


" COC Vim
set hidden
set nobackup
set nowritebackup
set cmdheight=3
set updatetime=300
set shortmess+=c

inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Coc Plugins
" coc extensions
let g:coc_global_extensions = ['coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier', 'coc-eslint']

" coc-highlights
set termguicolors
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" For coc-pairs move cursor between pairs on new line
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

set autoread
au CursorHold,CursorHoldI * checktime
" au FocusGained,BufEnter * :checktime
"
" Enable system clipboard
" set clipboard=unnamedplus


" True color support vim-one 
"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
