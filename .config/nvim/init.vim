" VIM-PLUG {{{

call plug#begin()

"{{ The Basics }}
	Plug 'itchyny/lightline.vim'				        " Lightline statusbar
	Plug 'frazrepo/vim-rainbow'				            " Rainbow brackets
	Plug 'tpope/vim-surround'				            " Change surrounding marks
    Plug 'tpope/vim-endwise'                            " Automatically end structures
    Plug 'terryma/vim-smooth-scroll'                    " Smooth scrolling
    Plug 'ap/vim-css-color'                             " Highlight hex colors
    Plug 'jesseleite/vim-noh'                           " clear search highlighting when cursor is moved
"{{ Telescope }}
    Plug 'nvim-telescope/telescope.nvim'                " Telescope
    Plug 'nvim-lua/plenary.nvim'                        " required for Telescope
    Plug 'BurntSushi/ripgrep'                           " required for live_grep and grep_string
    Plug 'nvim-telescope/telescope-fzf-native.nvim'     " native telescope sorter to significantly improve sorting performance
"{{ NERDTree }}
	Plug 'scrooloose/nerdtree' |				        " Nerdtree
                \ Plug 'ryanoasis/vim-devicons'	|		" Icons for Nerdtree
                \ Plug 'Xuyuanp/nerdtree-git-plugin'    " Git in Nerdtree
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'		" Highlighting Nerdtree
    Plug 'PhilRunninger/nerdtree-visual-selection'      " visual select in Nerdtree
"{{ Syntax Highlighting and Colors }}
    Plug 'nvim-treesitter/nvim-treesitter'              " Syntax highlighting
	Plug 'PotatoesMaster/i3-vim-syntax'			        " i3 config highlighting
    Plug 'sophacles/vim-processing'
"{{ Git }}
    Plug 'mhinz/vim-signify'                    " indicate added, modified, removed lines in sign column
    Plug 'itchyny/vim-gitbranch'                " provides a function to return the current git branch
    Plug 'itchyny/vim-fugitive'                 " Git commands in Vim
"{{ LSP (from old dotfiles) }}
    Plug 'neovim/nvim-lspconfig'               " lsp
    Plug 'kabouzeid/nvim-lspinstall'           " adds :LspInstall <language> command to nvim-lspconfig
    Plug 'hrsh7th/vim-vsnip'                   " snippets for lsp
    Plug 'hrsh7th/vim-vsnip-integ'             " plugin integration for vim-vsnip
"{{ Cute stuff }}
	Plug 'junegunn/vim-emoji'				" Emojis for vim
    Plug 'kyazdani42/nvim-web-devicons'     " icons
"{{ Markdown }}
	Plug 'suan/vim-instant-markdown', {'rtp': 'after'}	" Markdown Preview
    Plug 'plasticboy/vim-markdown'          " for langauge-specific plugins
    Plug 'masukomi/vim-markdown-folding'    " Fold headers
"{{ Writing }}
    Plug 'reedes/vim-pencil'                " Make vim more friendly for writing
    Plug 'preservim/vim-lexical'            " Spell-check, dictionary & thesaurus completion
    Plug 'preservim/vim-litecorrect'        " Lightweight autocorrection (i.e. 'teh' -> 'the')
	Plug 'junegunn/goyo.vim'				" Distraction-free viewing
    Plug 'junegunn/limelight.vim'           " Focus segments of text
    Plug 'kana/vim-textobj-user'            " dependency for textobj-sentence
    Plug 'preservim/vim-textobj-sentence'             " Sentence text objects
    Plug 'reedes/vim-wordy'                 " Check for bad word
    Plug 'vim-pandoc/vim-pandoc'            " pandoc for vim
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'swordguin/vim-veil'               " ignore your inner editor and hide text from prying eyes
"{{ Colorschemes }}
    Plug 'morhetz/gruvbox'
    Plug 'rakr/vim-one'
    Plug 'mhartington/oceanic-next'
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'jeffkreeftmeijer/vim-dim'
    Plug 'ayu-theme/ayu-vim'
    Plug 'romgrk/doom-one.vim'
    Plug 'preservim/vim-colors-pencil'

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
set hlsearch
set incsearch 			    " Incremental search
set ignorecase              " case insensitive search
set hidden			        " Needed to keep multiple buffers open
set backupdir=~/.nvim/backup//    " Set backup directory
set directory=~/.nvim/swap//      " Set swapfile directory
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
" vim-smooth-scroll
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <silent> <C-u> :call smooth_scroll#up(&scroll, 10, 2)<CR>
noremap <silent> <C-d> :call smooth_scroll#down(&scroll, 10, 2)<CR>
noremap <silent> <C-b> :call smooth_scroll#up(&scroll*2, 10, 4)<CR>
noremap <silent> <C-f> :call smooth_scroll#down(&scroll*2, 10, 4)<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-pencil
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype plugin on
augroup pencil
    autocmd!
    autocmd FileType markdown,mkd,text  call pencil#init()
                                    \ | call lexical#init()
                                    \ | call litecorrect#init()
                                    \ | setl spell spl=en_us fdl=4 noru nonu nornu
                                    \ | setl fdo+=search
augroup END

" Pencil writing controls
let g:pencil#wrapModeDefault = 'soft'   "default is 'hard'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Goyo and Limelight
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>gy :Goyo<CR>
autocmd! User GoyoEnter Limelight       " start Limelight on entering Goyo
autocmd! User GoyoLeave Limelight!      " turn off Limelight when leaving Goyo

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-veil
    nmap <Leader>vv <Plug>Veil

" vim-vsnip
    let g:completion_enable_snippet = 'vim-vsnip'
    " pmenu and vim-vsnip
    imap <expr> <Tab>   pumvisible() ? "<C-n>" : vsnip#jumpable(1)   ? "<Plug>(vsnip-jump-next)" : "<Tab>"
    imap <expr> <S-Tab> pumvisible() ? "<C-p>" : vsnip#jumpable(-1)  ? "<Plug>(vsnip-jump-prev)" : "<S-Tab>"
    smap <expr> <Tab>   vsnip#jumpable(1)  ? "<Plug>(vsnip-jump-next)" : "<Tab>"
    smap <expr> <S-Tab> vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<S-Tab>"
