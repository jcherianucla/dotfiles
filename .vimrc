" Vundle Plugin manager
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Rip-Rip/clang_complete'

call vundle#end()

" Plug manager
call plug#begin('~/.vim/plugged')

" Fuzzy file search with fzf
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Git gutter for relation to Git
Plug 'airblade/vim-gitgutter'

" Easy motion
Plug 'easymotion/vim-easymotion'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Airline for status bar
Plug 'bling/vim-airline'

call plug#end()

" CSS and HTML specific autocomplete using omnifunc
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd BufNewFile,BufRead *.scss             set ft=scss.css
" CLang based autocomplete with clang_complete using clang library
let s:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'
if isdirectory(s:clang_library_path)
	let g:clang_library_path=s:clang_library_path
endif
" Run all plugins installed via Pathogen
execute pathogen#infect()
" Show messages in status bar
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Auto start Nerdtree and move cursor to window
autocmd vimenter * NERDTree | wincmd p
" Close Nerdtree when all files closed
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Golang specific settings with vim-go and syntastic
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "gofmt"

" Basic syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

" Symbol mappings for syntastic
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

" Look for ctags in project for code jumps
let g:autotagTagsFile="tags"

" Show symbols in column
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" General Vim settings

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype plugin indent on
" Visually wrap lines onto next line
set wrap
set ruler
" Indentation setting for 4 spaces instead of tabs
set shiftwidth=4
set tabstop=4
"set smarttab
" Backspace should behave normally in Insert mode
set backspace=indent,eol,start
" Performing auto indentation based on above settings
set autoindent
set copyindent
" Show line numbers
set number
set shiftround
set showmatch
" Case insensitve search
set ignorecase
set smartcase
" Search highlighting
set hlsearch
set incsearch
" Allow mouse usage
set mouse=a
" Show minimum number of lines above and below cursor
set scrolloff=10
" Show more of status line
set laststatus=2
" Move cursor to different lines when navigating left or right
set whichwrap+=<,>,h,l
" Prevent running syntax highlighting multiple times
if !exists("g:syntax_on")
	syntax enable
endif

" Color Scheme
se t_Co=16
let g:solarized_termcolors=256  
set background=dark
if has('gui running')
	set background=light
else
	set background=dark
endif
colorscheme solarized

" Key Bindings

let mapleader = ","
let g:mapleader = ","

" Fast saving
map <leader>w :w!<cr>
" Fast close
map <leader>q :q<cr>
" Toggle NERDTree
map <leader>n :NERDTreeToggle<cr>
" Switch between files in buffer
map <leader>] :bn<cr>
map <leader>[ :bp<cr>
" Switch between split windows
map <leader><Tab> <C-w>w
map <leader><S-Tab> <C-w>W

" 0 takes you back to beginning of line with code
map 0 ^

imap jk <Esc>
" Turn off highlighting
nnoremap <esc><esc> :silent! nohls<cr>

set pastetoggle=<F2>

set grepprg=grep\ -nH\ $*
set iskeyword+=
