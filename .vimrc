set nu
set history=1024
set autoread
set wildmenu

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'
 
"""""""""""""""""""""""""
" php.vim
"""""""""""""""""""""""""
Plugin 'php.vim'

"""""""""""""""""""""""""
" Fugitive
"""""""""""""""""""""""""
Plugin 'tpope/vim-fugitive'


"""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""
Plugin 'scrooloose/nerdtree'
map zz :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"""""""""""""""""""""""""
" NERDTreeTabs
"""""""""""""""""""""""""
Plugin 'jistr/vim-nerdtree-tabs'
let mapleader = ","
"let g:nerdtree_tabs_open_on_console_startup=1
map <leader>n <plug>NERDTreeTabsToggle<CR>  

"""""""""""""""""""""""""
" bufexplorer
"""""""""""""""""""""""""
"Plugin 'bufexplorer.zip'
"let mapleader = ","
"map <leader>b :BufExplorer<CR>


"""""""""""""""""""""""""
" NERDCommenter
"""""""""""""""""""""""""
Plugin 'scrooloose/nerdcommenter'


"""""""""""""""""""""""""
" ctrlp
"""""""""""""""""""""""""
Plugin 'ctrlp.vim'
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.DS_Store,*~     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set wildignore+=.classpath,.project,.settings/*,*.jar,*.classes,.idea,lib/,libs/,bin/ " java
set wildignore+=*.log,*.log.*
set wildignore+=.git,.hg,.svn "ignore git
set wildignore+=node_modules/ "node.js
set wildignore+=*/build/,target/*,compressed/*,out/* "complie folder
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
nmap <c-b>b :CtrlPBuffer<cr>
nmap <c-b>m :CtrlPMixed<cr>
nmap <c-b>f :CtrlPMRU<cr>


"""""""""""""""""""""""""
" EasyMotion
"""""""""""""""""""""""""
Plugin 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = 'f'
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)


"""""""""""""""""""""""""
" surround
"""""""""""""""""""""""""
Plugin 'surround.vim'


"""""""""""""""""""""""""
" neocomplete
"""""""""""""""""""""""""
Plugin 'Shougo/neocomplcache'
let g:neocomplcache_enable_at_startup = 1


"""""""""""""""""""""""""
" neosnippet
"""""""""""""""""""""""""
Plugin 'shougo/neosnippet'


"""""""""""""""""""""""""
" Aireline
"""""""""""""""""""""""""
Plugin 'bling/vim-airline'
set laststatus=2
set ttimeoutlen=50
"let g:airline_symbols = {}
let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_enable_fugitive=1
"let g:airline_section_b='%{fugitive#statusline()}'
let g:airline_section_c="%F"
"let g:airline_section_x="%y"
"let g:airline_section_y='BN: %{bufnr("%")}'

"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = 'L'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.whitespace = 'Ξ'


"""""""""""""""""""""""""
" Taglist
"""""""""""""""""""""""""
"Plugin 'taglist.vim'
"let mapleader = ","
"map <leader>l :TlistToggle<CR>
"let Tlist_Ctags_Cmd = '/usr/bin/ctags'
""不同时显示多个文件的tag，只显示当前文件的
"let Tlist_Show_One_File = 1
""如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Exit_OnlyWindow = 1
""在右侧窗口中显示taglist窗口  "
"let Tlist_Use_Right_Window = 1       

"""""""""""""""""""""""""
" Taglist
"""""""""""""""""""""""""
Plugin 'majutsushi/tagbar'
let mapleader = ","
map <leader>l :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags' 

"""""""""""""""""""""""""
" vim multiple cursors
"""""""""""""""""""""""""
Plugin 'terryma/vim-multiple-cursors'
let g:multi_cursor_start_key='<C-m>'
let g:multi_cursor_next_key='<C-j>'
let g:multi_cursor_prev_key='<C-k>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
	if exists(':NeoCompleteLock')==2
		exe 'NeoCompleteLock'
	endif
endfunction

" Called once only when the multiple selection is canceled
" (default <Esc>)
function! Multiple_cursors_after()
	if exists(':NeoCompleteUnlock')==2
		exe 'NeoCompleteUnlock'
	endif
endfunction


"""""""""""""""""""""""""
"Yggdroot/indentLine
"""""""""""""""""""""""""
Plugin 'Yggdroot/indentLine'
let g:indentLine_color_term = 239
let g:indentLine_char = '┆'


"""""""""""""""""""""""""
" Mac Dash.app
"""""""""""""""""""""""""
"bundle 'rizzatti/funcoo.vim'
"bundle 'rizzatti/dash.vim'
"let mapleader = "?"
"nmap <silent> <leader>d <Plug>DashSearch


" After Vundle
filetype plugin indent on




"""""""""""""""""""""""""
" config
"""""""""""""""""""""""""
let mapleader = "/"
set tags=tags;
set autochdir
set enc=utf-8
set fencs=utf-8,gb18030,gbk,gb2312
set helplang=cn
set encoding=utf-8


"set backup
set backupdir-=.
set backupdir^=~/tmp,/tmp

set backspace=indent,eol,start
"indent mode
"set autoindent
"set foldmethod=indent
set linespace=2
"show line and column number
set ruler
"display command
"set showcmd
"searching immediatly
set incsearch

autocmd FileType text setlocal textwidth=80

" About Tab
set noexpandtab "convert tab to space
set tabstop=4 "a tab equals 4 space"
set shiftwidth=4
set softtabstop=4

" Move between different window
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" color theme
set t_Co=256

let mapleader = ","
" fast reloading .vimrc
map <silent> <leader>ss :source ~/.vimrc<cr>
" fast editing .vimrc
map <silent> <leader>ee :e ~/.vimrc<cr>
" when .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

"buffer
""set hidden
"
"" To open a new empty buffer
"" This replaces :tabnew which I used to bind to this mapping
"nmap <c-n> :enew<cr>
nmap bq :bd<cr>
" noremap <silent> <C-S>          :update<CR>
" vnoremap <silent> <C-S>         <C-C>:update<CR>
" inoremap <silent> <C-S>         <C-O>:update<CR>

"" Move to the previous buffer
noremap <c-Left> :bprevious<CR>
" Move to the next buffer
noremap <c-Right> :bnext<CR>

cnoremap <C-A>  <Home>
cnoremap <C-E>  <End>
"
"nnoremap <silent> <Left> :bp<CR>
"nnoremap <silent> <Right> :bn<CR>

"" Close the current buffer and move to the previous one
"" This replicates the idea of closing a tab
""nmap <leader>bq :bp <BAR> bd #<CR>
"
"" Show all open buffers and their status
""nmap <leader>bl :ls<CR>

"set list listchars=tab:»»,trail:·
