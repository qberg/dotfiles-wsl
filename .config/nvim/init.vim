:set number
:set mouse=a
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set clipboard=unnamedplus

" Defining the leader key.
let mapleader = ' '


" Plugins for nvim
"
call plug#begin('~/.config/nvim/plugged')

Plug 'https://github.com/preservim/nerdtree'                " NerdTree
Plug 'https://github.com/tpope/vim-commentary'              " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline'           " Status bar
Plug 'vim-airline/vim-airline-themes'                       " Themes for airline
Plug 'https://github.com/ap/vim-css-color'                  " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes'     " Retro Scheme
Plug 'https://github.com/preservim/tagbar'                  " Tagbar for code navigation
Plug 'kshenoy/vim-signature'

" Native LSP
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
" Autocomplete framework using LSP
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
" snippet engine -> lua snip
Plug 'L3MON4D3/Luasnip'
Plug 'saadparwaiz1/cmp_luasnip'
" Enhance rust-analyzer
Plug 'simrat39/rust-tools.nvim'
" Java lsp
Plug 'mfussenegger/nvim-jdtls'


"Telescope requirements for fuzzy finding.
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make'}

" devicons
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'ryanoasis/vim-devicons'

"For indentation
Plug 'lukas-reineke/indent-blankline.nvim'

" qberg
Plug '/home/qberg_noe/mnt/a/coding/lua/plugins/stackmap.nvim/'

call plug#end()

    

nnoremap <C-w> :NERDTreeToggle<CR>

nmap <F8> :TagbarToggle<CR>


:colorscheme jellybeans 
let g:airline_theme='bubblegum'

" Telescope stuff.
" {{{
" will find .lua files that exists at runtime.
lua require("qberg")

" Remappings for telescope.
" nnoremap <C-_> :Telescope find_files <cr>
" nnoremap <C-\> :Telescope current_buffer_fuzzy_find sorting_strategy=ascending prompt_position=top <cr>
" Lua way of doing it...Note lua is space sensitive.
" nnoremap <C-_> <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <C-\> <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({sorting_strategy="ascending", prompt_position="top"})<cr>
" Putting the mappings in the customised lua file fofr better readability.
nnoremap <C-_> <cmd>lua require("qberg").ff() <cr>
nnoremap <C-\> <cmd>lua require("qberg").curr_buff() <cr>
" Keybinnding for clean sourcing.
nnoremap <F5> :lua package.loaded.qberg = nil <cr>:source ~/.config/nvim/init.vim <cr>
"}}}

" LSP autocompletion 
"{{{

" Go to lua...


" endof config }}}



" Keymappings for switching tabs.
" nnoremap works only in normal mode, whereas noremap works in all modes.
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 :tablast<cr>

