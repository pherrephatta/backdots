"" ALE
let g:ale_completion_enabled = 0
let g:ale_linters = {'c': ['clang'], 'cpp': ['clang', 'g++']}
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++1z'
let g:ale_c_clang_options = '-Wall -O2 -std=c99'
let g:ale_cpp_clang_options = '-Wall -O2 -std=c++17'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

set wrap linebreak nolist
set hidden
set nocompatible
set autoindent
set backspace=indent,eol,start
set smarttab
set number
set termguicolors
set ruler
set wildmenu
set relativenumber
filetype indent on
filetype plugin on
filetype on
syntax on
set clipboard=unnamed
set mouse=a
execute pathogen#infect()
call pathogen#helptags()
set noshowmode
set breakindent

set encoding=UTF-8
"set guifont=hack 9
"autocmd VimEnter * TableModeEnable

"" muComplete
set completeopt=menuone,noinsert
set shortmess+=c
let g:mucomplete#enable_auto_at_startup = 1
"" clang-complete
let g:clang_library_path='/usr/lib/libclang.so.9'
let g:clang_use_library = 1
let g:clang_user_options = '-std=c++14'
let g:clang_complete_auto = 1
" javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" Colorscheme
set t_Co=256
" set t_AB=^[[48;5;%dm
" set t_AF=^[[38;5;%dm
" colorscheme night
colorscheme neonwave
" colorscheme 1989
" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

let g:airline_powerline_fonts = 1
let g:airline_theme='lucius'

"Tab size and behavior
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4

if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

" vim-markdown settings
let g:vim_markdown_follow_anchor = 1
" let g:vim_markdown_conceal = 0
set conceallevel=2
let g:vim_markdown_folding_disabled = 0
let g:vim_markdown_new_list_item_indent = 2
set fcs=fold:\ ,vert:\|

"" NERDTREE AND STARTIFY
" NERDTree open with if file
" autocmd vimenter * NERDTree
" NERDTree open with if empty
"" autocmd StdinReadPre * let s:std_in=1
"" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"Open startify when the above is the case
autocmd VimEnter *
	\   if !argc()
	\ |   Startify
""	\ |   NERDTree
	\ |   wincmd w
	\ | endif

" OverCommandLine search and substitute
cabbrev %s OverCommandLine<cr>%s
cabbrev '<,'>s OverCommandLine<cr>'<,'>s
" NERDTree auto-close
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" NERDTree open on the right side
"let g:NERDTreeWinPos = "right"
" NERDTree File highlighting
"function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
"exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
"exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
"endfunction

" Persistent Undo Tree file
if has("persistent_undo")
set undodir=~/.vim/undodir/
set undofile
endif

" VimWiki
"let g:vimwiki_list = [
"\{'path': '~/vimwiki/'}
"\]
set foldlevel=20
let g:vimwiki_folding='expr'
" The following enables markdown syntax for vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
				   \ 'syntax': 'markdown', 'ext': '.md'}]

" Use incsearch instead of search
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

"" BINDINGS
" bind for tagbar
" nmap <F8> :TagbarToggle<CR>
" binds for tabs
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tn :tabnew<CR>
" Undo Tree
nnoremap <F5> :UndotreeToggle<cr>
" File Explorer
nnoremap <F3> :!ls<CR>:e

" Spell Check & Highlighting
" To disable, use `set nospell`, to correct a word, press `z=` on a mistake.
" set spelllang=en_us
set hlsearch
set nospell
au BufReadPost,FilterReadPost,FileReadPost,BufNewFile,BufReadPre,FilterReadPre,FileReadPre,BufAdd,BufCreate,BufEnter  * set nospell
" Below, press # on word to highlight all occurences of

" remember shortcuts:
" C-w w for switching windows
" T for creating a new tab

" fix for E382?
" set buftype=nofile
" autocmd FileType netrw setl bufhidden=delete

"" Completion
" `= 1` to turn off YouCompleteMe
" let g:loaded_youcompleteme = 0
"" Deoplete
"let g:deoplete#enable_at_startup = 1
"" VimCompletion
"set complete-=i
"set omnifunc=syntaxcomplete#Complete
"
let foldcolumn=0
autocmd FileType pandoc setlocal foldcolumn=0
