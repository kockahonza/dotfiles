""""""""""""""""""""""""""""""
" => Plugins
""""""""""""""""""""""""""""""
call plug#begin()

Plug 'l04m33/vlime', {'rtp': 'vim/'}

Plug 'kien/rainbow_parentheses.vim'

Plug 'lambdalisue/suda.vim'

Plug 'vim-airline/vim-airline-themes'

Plug 'morhetz/gruvbox'

" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'honza/vim-snippets'

Plug 'vim-airline/vim-airline'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-fugitive'

Plug 'jlanzarotta/bufexplorer'

Plug 'mileszs/ack.vim'

Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-commentary'

Plug 'svermeulen/vim-subversive'

Plug 'sirtaj/vim-openscad'

Plug 'dhruvasagar/vim-table-mode'

Plug 'unblevable/quick-scope'

Plug 'neovimhaskell/haskell-vim'

Plug 'jacoborus/tender.vim'

Plug 'simnalamburt/vim-mundo'

Plug 'metakirby5/codi.vim'

Plug 'tpope/vim-repeat'

Plug 'junegunn/goyo.vim'

Plug 'majutsushi/tagbar'

Plug 'calviken/vim-gdscript3'

Plug 'michaeljsmith/vim-indent-object'

Plug 'wellle/targets.vim'

" Plug 'sheerun/vim-polyglot'

" Plug 'neovimhaskell/haskell-vim'

call plug#end()


""""""""""""""""""""""""""""""
" => General config
""""""""""""""""""""""""""""""
set hidden
set backup
set undodir=~/.local/share/nvim/undo
set backupdir=~/.local/share/nvim/backup
set directory=~/.local/share/nvim/swp
set encoding=utf-8
set fileformat=unix
set clipboard=unnamed
set ignorecase
set smartcase
set incsearch
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set textwidth=0
set updatetime=100
set nowrap

set foldmethod=indent
set foldlevel=99

" Go to last cursor position
autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif

set verbose=0


""""""""""""""""""""""""""""""
" => UI stuff
""""""""""""""""""""""""""""""
set ruler
set showcmd
set undofile
set hlsearch
set showmatch
set wildmenu
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

syntax on
set relativenumber
set number

set termguicolors
colorscheme gruvbox
let g:gruvbox_contrast_dark="medium"
let g:gruvbox_improved_warnings=0
let g:gruvbox_improved_strings=0
set background=dark

autocmd VimEnter * AirlineTheme deus


""""""""""""""""""""""""""""""
" => Shortcuts (mappings)
""""""""""""""""""""""""""""""
map Y y$
let mapleader = ','
map <silent> <leader><cr> :noh<cr>

map <C-Down> <C-W>j
map <C-Up> <C-W>k
map <C-Left> <C-W>h
map <C-Right> <C-W>l

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <Tab> gt
map <S-Tab> gT
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext<cr>
map <leader>t+ :tabmove +1<cr>
map <leader>t- :tabmove -1<cr>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

map <leader>cd :cd %:p:h<cr>:pwd<cr>

map <leader>s :vsplit<cr>

try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

" Extra stuff for haskell
map <leader>hl :!hlint %<CR>
map <leader>hi :!hindent %<CR>
map <leader>hg :!kitty --detach ghcid "--command=stack ghci %"<CR><CR>

" Extra stuff for python
map <leader>pr :CocCommand python.execInTerminal<cr>


" Godotscript fancy stuff
" autocmd BufNewFile,BufRead *.gd set ft=python
" autocmd BufNewFile,BufRead *.gd set ft=python


"""""""""""""""""""""""""""""
" => Plugin configuration
"""""""""""""""""""""""""""""

" Coc
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:coc_snippet_next = "<C-Right>"
let g:coc_snippet_prev = "<C-Left>"

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
            \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

map <leader>cl :CocList<cr>
map <leader>cc :CocCommand<cr>

map <leader>d :CocList diagnostics<cr>

autocmd CursorHold * silent call CocActionAsync('highlight')

" Airline
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
let g:airline_powerline_fonts = 1

let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#tagbar#enabled = 0

" BufExplorer
map <leader>o :ToggleBufExplorer<cr>

" Nerd Tree
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map \ :NERDTreeToggle<cr>
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

" subversive substitution
nmap s <plug>(SubversiveSubstituteRange)

" RainbowParentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Vim-table-mode
let g:table_mode_map_prefix = '<Leader>x'

" Vim-haskell
" let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
" let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
" let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
" let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
" let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
" let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
" let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" Tagbar
let g:tagbar_type_haskell = {
            \ 'ctagsbin'  : 'hasktags',
            \ 'ctagsargs' : '-x -c -o-',
            \ 'kinds'     : [
            \  'm:modules:0:1',
            \  'd:data: 0:1',
            \  'd_gadt: data gadt:0:1',
            \  't:type names:0:1',
            \  'nt:new types:0:1',
            \  'c:classes:0:1',
            \  'cons:constructors:1:1',
            \  'c_gadt:constructor gadt:1:1',
            \  'c_a:constructor accessors:1:1',
            \  'ft:function types:1:1',
            \  'fi:function implementations:0:1',
            \  'o:others:0:1'
            \ ],
            \ 'sro'        : '.',
            \ 'kind2scope' : {
            \ 'm' : 'module',
            \ 'c' : 'class',
            \ 'd' : 'data',
            \ 't' : 'type'
            \ },
            \ 'scope2kind' : {
            \ 'module' : 'm',
            \ 'class'  : 'c',
            \ 'data'   : 'd',
            \ 'type'   : 't'
            \ }
            \ }
map <leader>m :TagbarToggle<cr>

""""""""""""""""""""""""""""""
" => Extras
""""""""""""""""""""""""""""""
" HEXmode stuff so it's not unusable
command -bar Hexmode call ToggleHex()
function ToggleHex()
    " hex mode should be considered a read-only operation
    " save values for modified and read-only for restoration later,
    " and clear the read-only flag for now
    let l:modified=&mod
    let l:oldreadonly=&readonly
    let &readonly=0
    let l:oldmodifiable=&modifiable
    let &modifiable=1
    if !exists("b:editHex") || !b:editHex
        " save old options
        let b:oldft=&ft
        let b:oldbin=&bin
        " set new options
        setlocal binary " make sure it overrides any textwidth, etc.
        silent :e " this will reload the file without trickeries 
        "(DOS line endings will be shown entirely )
        let &ft="xxd"
        " set status
        let b:editHex=1
        " switch to hex editor
        %!xxd
        autocmd BufWritePre * %!xxd -r
        autocmd BufWritePost * %!xxd
    else
        " restore old options
        let &ft=b:oldft
        if !b:oldbin
            setlocal nobinary
        endif
        " set status
        let b:editHex=0
        " return to normal editing
        %!xxd -r
        autocmd! BufWritePre *
        autocmd! BufWritePost *
    endif
    " restore values for modified and read only state
    let &mod=l:modified
    let &readonly=l:oldreadonly
    let &modifiable=l:oldmodifiable
endfunction
