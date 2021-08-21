call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ap/vim-css-color'
Plug 'liuchengxu/vista.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'ryanoasis/vim-devicons'
Plug 'lervag/vimtex'

Plug 'chriskempson/base16-vim'
Plug 'franbach/miramare'
Plug 'morhetz/gruvbox'

call plug#end()
