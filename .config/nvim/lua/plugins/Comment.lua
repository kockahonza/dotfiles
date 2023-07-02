return {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("Comment").setup({
            mappings = {
                basic = true,
                extra = false
            }
        })
    end
}
