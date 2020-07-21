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
" Plug 'https://github.com/tpope/vim-surround'
" Plug 'https://github.com/vim-airline/vim-airline'
" Plug 'https://github.com/zefei/vim-wintabs'

call plug#end()

" ##### Options ######
set nocompatible
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
set wildmenu
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
set ttyfast 		" Faster redrawing

" In normal mode: Ctrl-A will increment the next number, Ctrl-X will decrement the next number
" An octal number starts with '0', and a hex number starts with '0x' or '0X'. Decimal numbers can be preceded with a sign (any '+' is ignored, while '-' makes the number negative). 
set nrformats-=octal
set nrformats+=alpha

" Persistent Undo Tree file
if has("persistent_undo")
set undodir=~/.vim/undodir/
set undofile
endif

" VimWiki + enable Markdown syntax
set foldlevel=20
let g:vimwiki_folding='expr'
let g:vimwiki_list = [{'path': '~/vimwiki/',
				   \ 'syntax': 'markdown', 'ext': '.md'}]

" Spellchecking
" To disable : use 'set nospell'
" To correct a word : press 'z=' on a mistake.
set spelllang=en_us
set nospell
