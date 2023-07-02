return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        require("nvim-tree").setup({
            filters = { dotfiles = true },
            git = { enable = false },
            on_attach = function(bufnum)
                local api = require("nvim-tree.api")

                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnum, noremap = true, silent = true, nowait = true }
                end

                vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
                vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node, opts('CD'))
                vim.keymap.set('n', '<C-k>', api.node.show_info_popup, opts('Info'))
                vim.keymap.set('n', 'x', api.node.open.preview, opts('Open Preview'))
                vim.keymap.set('n', '.', api.node.run.cmd, opts('Run Command'))
                vim.keymap.set('n', 'S', api.tree.search_node, opts('Search'))

                vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))
                vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts('Copy Relative Path'))
                vim.keymap.set('n', 'gy', api.fs.copy.absolute_path, opts('Copy Absolute Path'))

                vim.keymap.set('n', 'E', api.tree.expand_all, opts('Expand All'))
                vim.keymap.set('n', 'W', api.tree.collapse_all, opts('Collapse'))
                vim.keymap.set('n', 'F', api.live_filter.clear, opts('Clean Filter'))
                vim.keymap.set('n', 'f', api.live_filter.start, opts('Filter'))
                vim.keymap.set('n', 'H', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
                vim.keymap.set('n', 'I', api.tree.toggle_gitignore_filter, opts('Toggle Git Ignore'))

                vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
                vim.keymap.set('n', 't', api.node.open.tab, opts('Open: New Tab'))
                vim.keymap.set('n', 'T', function()
                    api.node.open.tab(); vim.cmd.tabprevious()
                end, opts('Open: New Tab'))
                vim.keymap.set('n', '<C-v>', api.node.open.vertical, opts('Open: Vertical Split'))
                vim.keymap.set('n', '<C-x>', api.node.open.horizontal, opts('Open: Horizontal Split'))

                vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
                vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
                vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
                vim.keymap.set('n', 'd', api.fs.trash, opts('Trash'))
                vim.keymap.set('n', '<C-r>', api.fs.rename_sub, opts('Rename: Omit Filename'))
                vim.keymap.set('n', 'e', api.fs.rename_basename, opts('Rename: Basename'))
                vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))

                vim.keymap.set('n', 'm', api.marks.toggle, opts('Toggle Mark'))
                vim.keymap.set('n', 'bd', function()
                    for i, node in ipairs(require('nvim-tree.marks').get_marks()) do
                        require("nvim-tree.actions.fs.trash").fn(node)
                    end
                end, opts('Trash Marked'))
                vim.keymap.set('n', 'bm', api.marks.bulk.move, opts('Move Marked'))

                vim.keymap.set('n', ']e', api.node.navigate.diagnostics.next, opts('Next Diagnostic'))
                vim.keymap.set('n', '[e', api.node.navigate.diagnostics.prev, opts('Prev Diagnostic'))

                vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
                vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
            end
        })

        vim.keymap.set("n", "\\", ":NvimTreeToggle<cr>")
    end,
}
