------------------------------------------
-- => General config
------------------------------------------
vim.opt.verbose = 0

vim.opt.hidden = true
vim.opt.backup = true
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.local/share/nvim/undo")
vim.opt.backupdir = vim.fn.expand("~/.local/share/nvim/backup")
vim.opt.directory = vim.fn.expand("~/.local/share/nvim/swp")

vim.opt.encoding = "utf-8"
vim.opt.fileformat = "unix"
vim.opt.clipboard = "unnamed"

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.textwidth = 0
vim.opt.wrap = false
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99

vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.hlsearch = true
vim.opt.showmatch = true
vim.opt.wildmenu = true
vim.opt.wildignore = { "*.o", "*~", "*.pyc", "*/.git/*", "*/.hg/*", "*/.svn/*", "*/.DS_Store" }

vim.cmd.syntax("off")
vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.switchbuf = "split"
vim.opt.showtabline = 2

------------------------------------------
-- => Shortcuts (mappings)
------------------------------------------
vim.g.mapleader = ","
vim.g.maplocalleader = "<"

vim.keymap.set("n", "Y", "y$")
vim.keymap.set("n", "<leader><cr>", ":noh<cr>", { silent = true })
vim.keymap.set("n", "<leader>s", ":vsplit<cr>")
vim.keymap.set("n", "<leader>cd", ":cd %:p:h<cr>:pwd<cr>")

vim.keymap.set("n", "<PageDown>", "30j")
vim.keymap.set("n", "<PageUp>", "30k")
vim.keymap.set({"n", "v"}, "<S-Down>", "10j")
vim.keymap.set({"n", "v"}, "<S-Up>", "10k")
vim.keymap.set({"n", "v"}, "<S-Left>", "10B")
vim.keymap.set({"n", "v"}, "<S-Right>", "10W")

vim.keymap.set("n", "<C-Down>", "<C-W>j")
vim.keymap.set("n", "<C-Up>", "<C-W>k")
vim.keymap.set("n", "<C-Left>", "<C-W>h")
vim.keymap.set("n", "<C-Right>", "<C-W>l")
vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-l>", "<C-W>l")

vim.keymap.set("n", "<Tab>", "gt")
vim.keymap.set("n", "<S-Tab>", "gT")
vim.keymap.set("n", "<leader>tn", ":tabnew<cr>")
vim.keymap.set("n", "<leader>to", ":tabonly<cr>")
vim.keymap.set("n", "<leader>tc", ":tabclose<cr>")
vim.keymap.set("n", "<leader>tm", ":tabmove")
vim.keymap.set("n", "<leader>t<leader>", ":tabnext<cr>")
vim.keymap.set("n", "<leader>t+", ":tabmove +1<cr>")
vim.keymap.set("n", "<leader>t-", ":tabmove -1<cr>")
-- Opens a new tab with the current buffer"s path
vim.keymap.set("n", "<leader>te", ':tabedit <c-r>=expand("%:p:h")<cr>/')

------------------------------------------
-- Start plugins by loading lazy
------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
    install = {
        colorscheme = { "gruvbox" }
    }
})

vim.keymap.set("n", "<leader>L", ":Lazy<cr>")

-- Highlight yank
vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank({ on_visual = false, timeout = 500 })")

-- TODO: To be moved elsewhere

-- TODO: colorscheme
-- set termguicolors
-- colorscheme gruvbox
-- let g:gruvbox_contrast_dark="medium"
-- let g:gruvbox_improved_warnings=0
-- let g:gruvbox_improved_strings=0
-- set background=dark
-- autocmd VimEnter * AirlineTheme deus

-- Python provider requires this
vim.g.python3_host_prog = '/usr/bin/python'

-- Go to last cursor position
-- autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif

-- ^^above^^ is from top

------------------------------------------
-- => Plugin configuration
------------------------------------------

-- TODO: Status
-- Airline
-- let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
-- let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
-- let g:airline_powerline_fonts = 1

-- let g:airline#extensions#coc#enabled = 1
-- let g:airline#extensions#tagbar#enabled = 0

-- TODO: Random thing but pretty useful
-- BufExplorer
-- map <leader>o :ToggleBufExplorer<cr>

-- TODO: File explorer
-- Nerd Tree
-- let g:NERDTreeWinPos = "left"
-- let NERDTreeShowHidden=0
-- let NERDTreeIgnore = ['\.pyc$', '__pycache__']
-- let g:NERDTreeWinSize=35
-- map \ :NERDTreeToggle<cr>
-- map <leader>nn :NERDTreeToggle<cr>
-- map <leader>nb :NERDTreeFromBookmark<Space>
-- map <leader>nf :NERDTreeFind<cr>

-- TODO: Convenient find/replace - a little buggy though...
-- subversive substitution
-- nmap s <plug>(SubversiveSubstituteRange)

-- TODO: Cool but not sure it even works
-- RainbowParentheses
-- au VimEnter * RainbowParenthesesToggle
-- au Syntax * RainbowParenthesesLoadRound
-- au Syntax * RainbowParenthesesLoadSquare
-- au Syntax * RainbowParenthesesLoadBraces

-- TODO: Random gimmick tbh
-- Vim-table-mode
-- let g:table_mode_map_prefix = '<Leader>x'

-- TODO: Don't use much
-- Tagbar
-- map <leader>b :TagbarToggle<cr>


------------------------------------------
-- => Specific language config
------------------------------------------
-- TODO: Cleared from old - review old for some stuff

------------------------------------------
-- => Extras
------------------------------------------
-- HEXmode stuff so it's not unusable
-- command -bar Hexmode call ToggleHex()
-- function ToggleHex()
--     " hex mode should be considered a read-only operation
--     " save values for modified and read-only for restoration later,
--     " and clear the read-only flag for now
--     let l:modified=&mod
--     let l:oldreadonly=&readonly
--     let &readonly=0
--     let l:oldmodifiable=&modifiable
--     let &modifiable=1
--     if !exists("b:editHex") || !b:editHex
--         " save old options
--         let b:oldft=&ft
--         let b:oldbin=&bin
--         " set new options
--         setlocal binary " make sure it overrides any textwidth, etc.
--         silent :e " this will reload the file without trickeries
--         "(DOS line endings will be shown entirely )
--         let &ft="xxd"
--         " set status
--         let b:editHex=1
--         " switch to hex editor
--         %!xxd
--         autocmd BufWritePre * %!xxd -r
--         autocmd BufWritePost * %!xxd
--     else
--         " restore old options
--         let &ft=b:oldft
--         if !b:oldbin
--             setlocal nobinary
--         endif
--         " set status
--         let b:editHex=0
--         " return to normal editing
--         %!xxd -r
--         autocmd! BufWritePre *
--         autocmd! BufWritePost *
--     endif
--     " restore values for modified and read only state
--     let &mod=l:modified
--     let &readonly=l:oldreadonly
--     let &modifiable=l:oldmodifiable
-- endfunction
-- map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
--             \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
--             \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
