return {
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = true,
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup()
        end
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim"
        },
        config = function()
            --require("lspconfig").clangd.setup()
            local lspconfig = require("lspconfig")
            lspconfig.clangd.setup({})
            lspconfig.bashls.setup({})
            lspconfig.cmake.setup({})
            lspconfig.pyright.setup({})
            lspconfig.lua_ls.setup({})
            lspconfig.julials.setup({})
            lspconfig.lemminx.setup({})

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    -- Buffer local mappings.
                    local opts = { buffer = ev.buf } -- only in this buffer

                    local function in_newtab_wrapper(fn)
                        return function()
                            vim.cmd("tab split")
                            fn()
                        end
                    end

                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)                        -- GOOD
                    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts) -- GOOD
                    vim.keymap.set('n', '<space>f', function()
                        vim.lsp.buf.format { async = true }
                    end, opts)

                    vim.keymap.set('n', '<space>D', in_newtab_wrapper(vim.lsp.buf.declaration), opts)     -- GOOD
                    vim.keymap.set('n', '<space>d', in_newtab_wrapper(vim.lsp.buf.definition), opts)      -- GOOD
                    vim.keymap.set('n', '<space>t', in_newtab_wrapper(vim.lsp.buf.type_definition), opts) -- dunno
                    vim.keymap.set('n', '<space>i', in_newtab_wrapper(vim.lsp.buf.implementation), opts)  -- Maybe?
                    vim.keymap.set('n', '<space>R', vim.lsp.buf.references, opts)                         -- Kinda cool, idk though

                    vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, opts)                             -- Probsyes
                    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)                        -- dunno

                    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)    -- probsnot
                    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts) -- probsnot
                    -- vim.keymap.set('n', '<space>wl', function()                                 -- probsnot
                    -- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    -- end, opts)
                end
            })
        end
    }
}
