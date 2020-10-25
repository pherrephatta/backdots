" ####### Neovim Sources #######
" https://neovim.io/doc/user/nvim.html#nvim-from-vim
" https://neovim.io/doc/user/vim_diff.html#vim-differences

" ####### vim-plug #######
"
" #### Commands ####
" PlugInstall [name ...] [#threads] 	Install plugins
" PlugUpdate [name ...] [#threads] 		Install or update plugins
" PlugClean[!]							Remove unlisted plugins (bang version will clean without prompt)
" PlugUpgrade							Upgrade vim-plug itself
" PlugStatus							Check the status of plugins
" PlugDiff								Examine changes from the previous update and the pending changes
" PlugSnapshot[!] [output path] 		Generate script for restoring the current snapshot of the plugins
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/vimwiki/vimwiki'
Plug 'https://github.com/mhinz/vim-startify'
Plug 'https://github.com/Raimondi/delimitMate'
Plug 'https://github.com/mbbill/undotree'
Plug 'https://github.com/ap/vim-buftabline'
Plug 'https://github.com/vim-scripts/OmniCppComplete'
Plug 'https://github.com/dense-analysis/ale'
Plug 'https://github.com/majutsushi/tagbar'
Plug 'https://github.com/sheerun/vim-polyglot'
Plug 'https://github.com/lifepillar/vim-mucomplete'
Plug 'https://github.com/xavierd/clang_complete'
" Plug 'https://github.com/tyru/open-browser.vim'
" Plug 'https://github.com/tpope/vim-surround'
" Plug 'https://github.com/vim-airline/vim-airline'
" Plug 'https://github.com/zefei/vim-wintabs'

call plug#end()

" ##### Options ######
set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on
scriptencoding utf-8
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set history=10000
set t_Co=256
set termguicolors
colorscheme neonwave
set clipboard+=unnamedplus

" #### UI ####
set autoindent
set backspace=indent,eol,start
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set ruler
set number
set relativenumber
set wrap nolist
set hidden			" Open new buffers, etc.
set linebreak		" Wrap sentences, not words
set breakindent		" Keep indent on wrap
set showmatch		" Show matching containers
set matchtime=5		" 0.5s to show matched container
set ignorecase		" Ignore case in search
set smartcase		" Except if uppercase in search
set hlsearch 		" Highlight searched
set incsearch		" Incremental search
set laststatus=2	" Always show status line
set mouse=a 		" Enable mouse

if !has('nvim')
	set ttyfast 		" Faster redrawing
endif

" In normal mode: Ctrl-A will increment the next number, Ctrl-X will decrement the next number
" An octal number starts with '0', and a hex number starts with '0x' or '0X'. Decimal numbers can be preceded with a sign (any '+' is ignored, while '-' makes the number negative). 
set nrformats-=octal
set nrformats+=alpha

" Persistent Undo Tree file
if has("persistent_undo")
set undofile
set undodir=~/.vim/undodir/
endif
" UndoTree
" Press ? in undotree window for quick help
nnoremap <F5> :UndotreeToggle<cr>

" VimWiki + enable Markdown syntax
set foldlevel=20
let g:vimwiki_folding='expr'
let g:vimwiki_list = [{'path': '~/vimwiki/',
				   \ 'syntax': 'markdown', 'ext': '.md'}]

" Spellchecking
" To disable : use 'set nospell'
" To correct a word : press 'z=' on a mistake
set spelllang=en_us
set nospell

" Fuzzy File Search
" Hit TAB to ':find' partial match, 
" * to make fuzzy
" ** for subfolders
set path+=*
set wildmenu

" Tag Jumping
" ^] to jump to tag under cursor
" g^] for ambiguous tags
" ^t jump pack up tag stack
" Create a ctag file
command! MakeTags !ctags --c++-kinds=+p --fields=+iaS --extras=+q --recurse=yes . 
set tags+=~/.vim/tags/cpp 
set tags+=~/.vim/tags/sdl2
set tags+=./tags
set tags+=./src/tags

" Completion
" ^ x ^ n` to search within file
" ^ x ^ f` to search filenames
" ^ x ^ ]` to search tags
" ^ n` to search anything specified by `complete` option (and go to next suggestion)
" ^ p` to go to previous suggestion
" See ':help ins-completion' for more info
"set complete=.,w,b,u,t,i,kspell
"set omnifunc=syntaxcomplete#Completd
"set omnifunc=ale#completion#OmniFunc " Use with <C-x><C-o>
" OmniCompletion
""let OmniCpp_NamespaceSearch = 1
""let OmniCpp_GlobalScopeSearch = 1
""let OmniCpp_ShowAccess = 1
""let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
""let OmniCpp_MayCompleteDot = 1 " autocomplete after .
""let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
""let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
""let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
""au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
""set completeopt=menuone,menu,longest,preview

" MuComplete
"set complete=.,w,b,u,k
set completeopt+=menuone,noselect
"set shortmess+=c " Shutoff completion messages
"set belloff+=ctrlg " Use if Vim beeps during completion
let g:mucomplete#enable_auto_at_startup = 1 " MuComplete at startup
"let g:mucomplete#completion_delay = 1 " delay to autocompletion
"let g:mucomplete#force_manual = 1 " No auto popup, press tab
" Allow auto popup without tab key for member completion in cpp, also if manually invoked via tab key:
"let g:mucomplete#chains = {}
"let g:mucomplete#chains.default = ['omni', 'c-n', 'path', 'tags']
"let g:mucomplete#chains.default = ['omni', 'path', 'tags']

if !has('nvim')
	let s:cpp_cond = { t -> (t =~# '\m\(\k\|)\|]\)\%\(->\|::\|\.\)$') || (g:mucomplete_with_key && t =~# '\m\k\k$') }
	let g:mucomplete#can_complete.cpp = { 'omni': s:cpp_cond }
	set shortmess += c " turn off completion messages
	set belloff += ctrlg " turn off beeps during completion
endif

" clang-complete
let g:clang_use_library = 1
let g:clang_complete_auto = 1
let g:clang_library_path='/usr/lib/libclang.so.10'
let g:clang_user_options = '-std=c++17'

" Explorer
" See ':help netrw-browse-maps' for more info
" use ':Explorer' to open
" 'gh' to hide dot files
" CTRL+6 or CTRL+^ to go back, or simply :bd
let g:netrw_liststyle=3	" Enable tree view
let g:netrw_banner=0 " Disable banner

" ALE Linting
" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 0
"let g:ale_completion_enabled = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\	'c': ['gcc'],
\	'cpp': ['gcc'],
\	'java': ['javac'],
\}
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++17'
let g:ale_c_clang_options = '-Wall -O2 -std=c99'
let g:ale_cpp_clang_options = '-Wall -O2 -std=c++17'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Toggle netrw 
let g:NetrwIsOpen=0
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore	20 " place netrw to left vertical split
    endif
endfunction
" Press F3 to toggle netrw
nnoremap <silent> <F3> :call ToggleNetrw()<CR>
