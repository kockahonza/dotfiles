return {
    "j-morano/buffer_manager.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = function()
        local buffer_manager = require("buffer_manager.ui")
        vim.keymap.set("n", "<leader>o",buffer_manager.toggle_quick_menu)
    end
}
