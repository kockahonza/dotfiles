return {
    "gbprod/substitute.nvim",
    event = "VeryLazy",
    config = function()
        local sub = require("substitute")
        sub.setup()

        local sub_range = require("substitute.range")

        vim.keymap.set("n", "<leader>r", sub_range.operator, { noremap = true })
        vim.keymap.set("n", "<leader>R", function()
            sub_range.operator({
                range = "%",
                confirm = true
            })
        end
        , { noremap = true, })
        vim.keymap.set("x", "<leader>r", sub_range.visual, { noremap = true })
    end
}
