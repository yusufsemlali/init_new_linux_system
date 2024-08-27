call plug#begin('~/.vim/plugged')

" Plugin list
Plug 'loctvl842/monokai-pro.nvim'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'mileszs/ack.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ryanoasis/vim-devicons'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'mg979/vim-visual-multi'
Plug 'ghifarit53/tokyonight-vim'
call plug#end()


" Tabbing and Indentations
set noexpandtab      " Use tabs instead of spaces

" settings for NerdTree.
nnoremap <C-f> :NERDTreeToggle<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
" Enable line numbers 
set number 
set relativenumber
" Setting monokai color scheme
colorscheme monokai-pro-classic
set termguicolors

let g:tokyonight_style = 'storm' " available: night, storm
let g:lightline = {'colorscheme' : 'tokyonight'}
let g:tokyonight_enable_italic = 1
let g:airline_theme = "tokyonight"
colorscheme tokyonight


