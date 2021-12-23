"                                "
"     Zukuo's Neovim Config!     "
"   _____     _                  "
"  |__  /   _| | ___   _  ___    "
"    / / | | | |/ / | | |/ _ \   "
"   / /| |_| |   <| |_| | (_) |  "
"  /____\__,_|_|\_\\__,_|\___/   "
"                                "

"---------"
" Plugins
"---------"
" Install vim plug if not installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')
	
    " Basic
    Plug 'nvim-lua/plenary.nvim'
    Plug 'scrooloose/nerdtree'
    Plug 'junegunn/fzf.vim'

    " Eye Candy 
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'glepnir/dashboard-nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'psliwka/vim-smoothie'

    " Formatting
    Plug 'windwp/nvim-autopairs'
    Plug 'ethanholz/nvim-lastplace'
    Plug 'b3nj5m1n/kommentary'
    Plug 'matze/vim-move'

    " Completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Markdown Plugins
    Plug 'junegunn/goyo.vim'
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'

    " Themes
    Plug 'morhetz/gruvbox'
    Plug 'romgrk/doom-one.vim'
    Plug 'srcery-colors/srcery-vim'
    Plug 'joshdick/onedark.vim'
    Plug 'sainnhe/everforest'
    Plug 'sainnhe/sonokai'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'JavaCafe01/javacafe.vim'
    Plug 'catppuccin/nvim'
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

call plug#end()

"-------------------"
" Default Settings
"-------------------"
syntax on
set mouse=a
set cursorline
set number relativenumber
set nu rnu
set nofoldenable
set splitright
set title
set ignorecase
set smartcase
" set clipboard=unnamedplus
set shiftwidth=4 autoindent smartindent tabstop=4 softtabstop=4 expandtab
au FileType * set fo-=c fo-=r fo-=o

"-----------------"
" Theme Settings
"-----------------"
set termguicolors
colorscheme tokyonight
autocmd ColorScheme dracula highlight DraculaComment cterm=italic gui=italic
let g:gruvbox_italic=1
let g:srcery_transparent_background = 1
set background=dark

" Transparency
" hi! Normal ctermbg=NONE guibg=NONE 
" hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

"------------------"
" Custom Mappings
"------------------"
nnoremap <SPACE> <Nop>
let mapleader=" "

nnoremap <silent> <leader><ENTER> :Goyo<CR>
nnoremap <silent> <C-s> :w<CR>

nnoremap <silent> <A-Up> :wincmd k<CR>
nnoremap <silent> <A-Down> :wincmd j<CR>
nnoremap <silent> <A-Left> :wincmd h<CR>
nnoremap <silent> <A-Right> :wincmd l<CR>

map <leader>y "+y
map <leader>p "+p

nnoremap <silent> <C-p> :Files<CR>
nnoremap <leader>t :vsplit +Explore<CR>

" keep visual mode after indent
vnoremap > >gv
vnoremap < <gv

"--------------------"
" Pear Tree Settings
"--------------------"
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

"----------------------------"
" Nerd Tree & File Explorer
"----------------------------"
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

"--------------"
" Goyo Config
"--------------"
let g:goyo_width = 120

"--------------"
" Vim-Airline
"--------------"
let g:airline_powerline_fonts = 1
if $TERM == 'linux'
   let g:airline_powerline_fonts = 0
   let g:webdevicons_enable = 0
endif

"-------------"
" CoC Config
"-------------"

"TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use <Tab> for confirm completion.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"

" Use <c-space> for trigger completion.
inoremap <silent><expr> <C-Space> coc#refresh()

" " GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" " Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" " Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)

" " Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder.
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" " Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

"-------------------"
" TreeSitter Config
"-------------------"
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true
  },
}
EOF

"----------------"
" LuaLine Config
"----------------"
lua <<EOF
require('lualine').setup({
    options = {
        section_separators = { left = "", right = ""},    -- e0b4 / e0b6 : https://www.nerdfonts.com/cheat-sheet
        component_separators = { left = '', right = ''},  -- e0b5 / e0b7
    },
    sections = {
        lualine_x = {"filetype"}
    }
})
EOF

"---------------------"
" Lua Plugins Config
"---------------------"
lua require'colorizer'.setup()
lua require('nvim-autopairs').setup{}
lua require('gitsigns').setup()
lua require'nvim-lastplace'.setup{}

let g:dashboard_disable_statusline = 1
let g:dashboard_default_executive = "fzf"
lua vim.g.dashboard_custom_footer = {"   ",}
let g:dashboard_custom_header =<< trim END
=================     ===============     ===============   ========  ========
\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
||.=='    _-'                                                     `' |  /==.||
=='    _-'                        N E O V I M                         \/   `==
\   _-'                                                                `-_   /
 `''                                                                      ``'
END
