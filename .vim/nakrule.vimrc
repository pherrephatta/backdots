""" Nakrule vimrc
" It work the same way in neovim, except that eclim is not supported as far as I know.
" Depedency:
" - Install exuberant-ctags (sudo apt install exuberant-ctags) for vim-tagbar plugin
" - Run the python installer for YouCompleteMe
" - If you want eclim for code completion from eclipse, install eclipse and then follow the eclim
"   documentation.

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Nice start page when starting VIM without a file
Plug 'mhinz/vim-startify'

" Search file to open with :CtrlP
Plug 'ctrlpvim/ctrlp.vim'

" Better syntax file for better colorisation for a lot of languages
Plug 'sheerun/vim-polyglot'

" NERDtree and the tab extension to keep nerdtree sync between all tabs.
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

" Shell in NeoVim
Plug 'Shougo/deol.nvim'

" Networking syntax
Plug 'momota/cisco.vim'
Plug 'momota/junos.vim'

" Nice status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'airblade/vim-gitgutter' " Show github add/delete in the margin

" Auto complete
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'         " The snippet engine
Plug 'honza/vim-snippets'       " The snippets
Plug 'ervandew/supertab'        " Needed to use tab to expand trigger with youcompleteme

" Themes
Plug 'sjl/badwolf'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'

" To use tagbar, exuberant-ctags should be installed
" sudo apt install exuberant-ctags
Plug 'majutsushi/tagbar' " For tag bar list in the windows

Plug 'tpope/vim-fugitive' " Git integration
Plug 'psliwka/vim-smoothie' " Super smooth scrooling in VIM with CTRL-U/D

call plug#end()

" Use fd as escape
:imap fd <Esc>

" set the backspace to delete normally
set backspace=indent,eol,start

autocmd BufWritePre * %s/\s\+$//e " Remove all white space at the end of each line when saving a file
autocmd BufWritePre * retab       " Replace all tab with spaces
autocmd BufWritePre * set fileformat=unix  " Replace CRLF to LF (windows to linux line ending)

" Colorscheme configuration
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'hard'

set number
set expandtab "use space instead of tab
set shiftwidth=2 "number of space char inserted for identation
set tabstop=2

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" Use tab to expand trigger with ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

" map escape key to leave terminal mode with deol
:tnoremap <Esc> <C-\><C-n>

" resize window using 7, 8, 9 and 0 keys
nmap 6 :res +2<CR> " increase pane by 2
nmap 7 :res -2<CR> " decrease pane by 2
nmap 8 :vertical res +2<CR> " vertical increase pane by 2
nmap 9 :vertical res -2<CR> " vertical decrease pane by 2

" relative line number with auto switch to normal in insert mode and without pane focus
:set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Reduce update to 0.1s (from 4s) so the plugin VIM-gitgutter work better
set updatetime=100

" Auto close NERDTree when exiting latest opened file in VIM
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * wincmd p

" Need this if using both Eclim and YouCompletMe
let g:EclimCompletionMethod = 'omnifunc'

" Share the VIM clipboard with the X11 clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

" Set rler at 100 char
set colorcolumn=100

" Set auto line return after 100 char
set tw=100

""""""""""" VIM-Airline configuration
let g:airline_powerline_fonts = 1
" Make airline looks like powerline
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])

" The following 8 lines place the windows number is the left of vim-airline
function! WindowNumber(...)
  let builder = a:1
  let context = a:2
  call builder.add_section('airline_b', '%{tabpagewinnr(tabpagenr())}')
  return 0
endfunction
call airline#add_statusline_func('WindowNumber')
call airline#add_inactive_statusline_func('WindowNumber')


""""" SPACE mapping

" Switch buffer with SPACE + <number> (like in spacevim)
nnoremap <space>1 1<C-w>w
nnoremap <space>2 2<C-w>w
nnoremap <space>3 3<C-w>w
nnoremap <space>4 4<C-w>w
nnoremap <space>5 5<C-w>w
nnoremap <space>6 6<C-w>w
nnoremap <space>7 7<C-w>w
nnoremap <space>8 8<C-w>w
nnoremap <space>9 9<C-w>w

" Open and close NERDTree with SPACE+n
"nnoremap <space>n :NERDTreeToggle<CR>
nnoremap <space>n :NERDTreeTabsToggle<CR>

" Buffer configuration
" SPACE-K     Toggle between last two active buffer
" SPACE-H/L   Go to next/previous buffer
" SPACE-B     Open a new buffer (tab)
" SPACE-T     Toggle Tagbar
nnoremap <space>b     :tabnew<CR>
nnoremap <space>b     <Esc>:tabnew<CR>
" move to the previous/next tabpage.
nnoremap <space>h gT
nnoremap <space>l gt
" Go to last active tab
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <space>k :exe "tabn ".g:lasttab<cr>
"vnoremap <silent> <space>l :exe "tabn ".g:lasttab<cr>
" Toggle tagbar
nnoremap <space>t :TagbarToggle<CR>

""""""" Tagbar configuration

" Auto open Tagbar when editing Java files
autocmd FileType java call SetJavaOptions()
function! SetJavaOptions()
  :call tagbar#autoopen(0)
  let java_highlight_functions = 1
  let java_highlight_all = 1
endfunction

" Remape Tagbar show prototype to o (default is space, but it fuck up SPACE + number)
let g:tagbar_map_showproto = "o"

" Remove some clipboard stuff to start VIM faster. See
" https://stackoverflow.com/questions/14635295/vim-takes-a-very-long-time-to-start-up
""set clipboard=exclude:.*u
