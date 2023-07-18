return {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = {
        {
            "s",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump()
            end,
            desc = "Flash",
        }
    },
    config = function()
        require("flash").setup({
            modes = {
                search = { enabled = false }
            }
        })
    end
}
