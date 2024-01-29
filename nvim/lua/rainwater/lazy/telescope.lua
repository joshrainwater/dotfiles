return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope-live-grep-args.nvim",
    },
    config = function ()
        require("telescope").setup({
            defaults = {
                path_display = {"smart"},
            }
        })
    end
}
