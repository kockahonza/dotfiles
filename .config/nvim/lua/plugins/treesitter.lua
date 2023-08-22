return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = {
        "FileType",
    },
    dependencies = { "HiPhish/nvim-ts-rainbow2" },
    config = function()
        if (vim.bo.filetype ~= "tex") then
            require("nvim-treesitter.configs").setup({
                auto_install = true,
                ensure_installed = {
                    "bash",
                    "c",
                    "cpp",
                    "html",
                    "javascript",
                    "json",
                    "lua",
                    "luadoc",
                    "luap",
                    "markdown",
                    "markdown_inline",
                    "python",
                    "query",
                    "regex",
                    "tsx",
                    "typescript",
                    "vim",
                    "vimdoc",
                    "yaml",
                    "latex",
                    "bibtex"
                },
                highlight = {
                    enable = true
                },
                indent = {
                    enable = true
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<cr>",
                        node_incremental = "<cr>",
                        scope_incremental = false,
                        node_decremental = "<bs>"
                    }
                },
                rainbow = {
                    enable = true,
                    -- Which query to use for finding delimiters
                    query = 'rainbow-parens',
                    -- Highlight the entire buffer all at once
                    strategy = require('ts-rainbow').strategy.global,
                }
            })
        else
            vim.cmd.syntax("on")
        end
    end
}
