:set number                                              " Show line numbers
:set relativenumber                                      " Show relative row numbers of current
:set autoindent                                          " Auto-indent new lines
:set tabstop=2
:set shiftwidth=2
:set smarttab
:set softtabstop=2
:set mouse=a
:set cindent																						 " Use 'C' style program indenting
:set backspace=indent,eol,start	                         " Backspace behaviour
:set guicursor+=n:hor20-Cursor/lCursor                   " Set cursor type to underline
:set guicursor+=i:hor20-Cursor/lCursor

:set confirm                                             " Prompt confirmation dialogs
:set autoindent	                                         " Auto-indent new lines
:set cindent	                                           " Use 'C' style program indenting
:set expandtab	                                         " Use spaces instead of tabs
:set shiftwidth=2	                                       " Number of auto-indent spaces
:set smartindent	                                       " Enable smart-indent
:set smarttab	                                           " Enable smart-tabs
:set softtabstop=2	                                     " Number of spaces per Tab

:set guicursor+=i:hor20-Cursor/lCursor                   " Set cursor type to underline for insert mode

:highlight Cursor guifg=white guibg=black                " Set cursor selection colors
:highlight lCursor guifg=white guibg=steelblue

call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'tveskag/nvim-blame-line' " A small plugin that uses neovims virtual text to print git blame info at the end of the current line.
Plug 'numkil/ag.nvim' " A code searching tool similar to ack, with a focus on speed.

set encoding=UTF-8

call plug#end()

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

" Keybinding blame line
nnoremap <silent> <leader>eb :ToggleBlameLine<CR>
nnoremap <silent> <leader>db :DisableBlameLine<CR>

nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews

:colorscheme jellybeans

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
