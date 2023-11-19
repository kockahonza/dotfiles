return {
    "klen/nvim-config-local",
    event = { "VeryLazy" },
    config = function()
        require("config-local").setup( {lookup_parents = true} )
        vim.cmd(":ConfigLocalSource")
    end
}
