" VIM-PLUG {{{

call plug#begin()

"{{ The Basics }}
	Plug 'itchyny/lightline.vim'				        " Lightline statusbar
	Plug 'suan/vim-instant-markdown', {'rtp': 'after'}	" Markdown Preview
	Plug 'frazrepo/vim-rainbow'				            " Rainbow brackets
	Plug 'tpope/vim-surround'				            " Change surrounding marks
    Plug 'tpope/vim-endwise'                            " Automatically end structures
"{{ File Management }}
	" Plug 'vifm/vifm.vim'					            " Vifm
    Plug 'nvim-telescope/telescope.nvim'                " Telescope
    Plug 'sophacles/vim-processing'
"{{ NERDTree }}
	Plug 'scrooloose/nerdtree' |				        " Nerdtree
                \ Plug 'ryanoasis/vim-devicons'	|		" Icons for Nerdtree
                \ Plug 'Xuyuanp/nerdtree-git-plugin'    " Git in Nerdtree
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'		" Highlighting Nerdtree
    Plug 'PhilRunninger/nerdtree-visual-selection'      " visual select in Nerdtree
    
"{{ Syntax Highlighting and Colors }}
	Plug 'PotatoesMaster/i3-vim-syntax'			        " i3 config highlighting
"{{ Git }}
    Plug 'mhinz/vim-signify'                    " indicate added, modified, removed lines in sign column
    Plug 'itchyny/vim-gitbranch'                " provides a function to return the current git branch
    Plug 'itchyny/vim-fugitive'                 " Git commands in Vim
"{{ LSP (from old dotfiles) }}
    "Plug 'neovim/nvim-lspconfig'               " lsp
    "Plug 'kabouzeid/nvim-lspinstall'           " adds :LspInstall <language> command to nvim-lspconfig
    "Plug 'hrsh7th/vim-vsnip'                   " snippets for lsp
    "Plug 'hrsh7th/vim-vsnip-integ'             " plugin integration for vim-vsnip
"{{ Junegunn Choi Plugins }}
	"Plug 'junegunn/vim-emoji'				" Emojis for vim
"{{ Writing }}
    Plug 'dpelle/vim-LanguageTool'          " Check spelling & grammar
    "Plug 'ron89/thesaurus_query.vim'        " Thesaurus
	Plug 'junegunn/goyo.vim'				" Distraction-free viewing
    Plug 'junegunn/limelight.vim'           " Focus segments of text
    Plug 'reedes/vim-pencil'                " Make vim more friendly for writing
    Plug 'reedes/vim-wordy'                 " Check for bad word
    Plug 'plasticboy/vim-markdown'          " for langauge-specific plugins
"{{ Colorschemes }}
    Plug 'morhetz/gruvbox'
    Plug 'rakr/vim-one'
    Plug 'mhartington/oceanic-next'
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'jeffkreeftmeijer/vim-dim'
    Plug 'ayu-theme/ayu-vim'
    Plug 'romgrk/doom-one.vim'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""
"set path+=**			    " Searches current directory recursively
set termguicolors
let ayucolor="mirage"
colorscheme ayu
set wildmenu			    " Display all matches when tab completing
set wildmode=longest,full
set ignorecase              " case insensitive search
set incsearch 			    " Incremental search
set hidden			        " Needed to keep multiple buffers open
set nobackup			    " No auto backups
set noswapfile			    " No swap
set t_Co=256			    " Set if term supports 256 colors
set number			        " Display line numbers
" Show line numbers only in current window
au WinEnter * :setlocal number      
au WinLeave * :setlocal nonumber
set scrolloff=3             " keep 3 lines above and below cursor
set clipboard=unnamedplus	" Copy/paste between vim and other programs
syntax enable
let g:rehash256 = 1
set updatetime=100          " default updatetime 4000ms is not good for async update (i.e. vim-signify)
set nowrap                  " disable wrapping


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Status Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The lightline.vim theme

let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead'
  \ },
  \ }


" Always show statusline
set laststatus=2

" Remove vim statusline to make room for Lightline
set noshowmode


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab, and indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab			    " Use spaces instead of tabs
set smarttab			    " Apparently it takes care of some cases?
set shiftwidth=4		    " One tab == four spaces
set tabstop=4			    " One tab == four spaces
filetype plugin indent on   "allow auto-indenting depending on filetype

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <Space> <Nop>
sunmap <Space>
let mapleader=" "                   " Leader


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mouse Scrolling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=nicr
set mouse=a

autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright
"set fillchars+=vert:\ 
highlight VertSplit cterm=NONE


" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Making adjusting split sizes a little more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Toggle 2 split windows between vert and horiz
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Remove pipes | that act as separators on splits
" set fillchars+=vert:\


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"augroup Markdown
    "autocmd!
    "autocmd FileType markdown set wrap
"augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 38


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TELESCOPE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap ff <cmd>Telescope find_files<CR>
nnoremap fg <cmd>Telescope live_grep<CR>
nnoremap fb <cmd>Telescope buffers<CR>
nnoremap fh <cmd>Telescope help_tags<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-pencil
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype plugin on
let g:pencil#WrapModeDefault = 'soft'   "default is 'hard'
augroup pencil
    autocmd!
    autocmd FileType markdown,mkd call pencil#init()
    autocmd FileType text         call pencil#init()
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"	" vim-vsnip
"		let g:completion_enable_snippet = 'vim-vsnip'
"		" pmenu and vim-vsnip
"		imap <expr> <Tab>   pumvisible() ? "<C-n>" : vsnip#jumpable(1)   ? "<Plug>(vsnip-jump-next)" : "<Tab>"
"		imap <expr> <S-Tab> pumvisible() ? "<C-p>" : vsnip#jumpable(-1)  ? "<Plug>(vsnip-jump-prev)" : "<S-Tab>"
"		smap <expr> <Tab>   vsnip#jumpable(1)  ? "<Plug>(vsnip-jump-next)" : "<Tab>"
"		smap <expr> <S-Tab> vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<S-Tab>"
