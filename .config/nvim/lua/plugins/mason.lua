return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        lazy = true,
        event = "VeryLazy",
        config = function()
            require("mason").setup()
        end
    }
}
