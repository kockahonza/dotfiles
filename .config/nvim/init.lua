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
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99

vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.hlsearch = true
vim.opt.showmatch = true
vim.opt.wildmenu = true
vim.opt.wildignore = { "*.o", "*~", "*.pyc", "*/.git/*", "*/.hg/*", "*/.svn/*", "*/.DS_Store" }

-- Mostly syntax off as treesitter is used - though may be turned on in treesitter config
vim.cmd.syntax("off")
vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.switchbuf = "split"
vim.opt.showtabline = 2

-- Highlight yank
vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank({ on_visual = false, timeout = 500 })")

-- Python provider requires this
vim.g.python3_host_prog = '/usr/bin/python'
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
vim.keymap.set({ "n", "v" }, "<S-Down>", "10j")
vim.keymap.set({ "n", "v" }, "<S-Up>", "10k")
vim.keymap.set({ "n", "v" }, "<S-Left>", "10B")
vim.keymap.set({ "n", "v" }, "<S-Right>", "10W")

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

-- Toggle textwidth for automatic insert mode wrapping and wrapping using gq (this is why formatexpr is reset)
vim.keymap.set("n", "<leader>w", function()
    if vim.opt.textwidth:get() == 0 then
        vim.opt.textwidth = 120
    else
        vim.opt.textwidth = 0
    end
    print("textwidth set to", vim.opt.textwidth:get())
end)

------------------------------------------
-- Load lazy.nvim
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
