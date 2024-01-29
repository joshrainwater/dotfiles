return {
    "nvim-treesitter/nvim-treesitter",
    
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects"
    },

    build = ":TSUpdate",

    config = function ()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "lua", "vim", "vimdoc", "query", "javascript", "html", "php", "typescript", "css", "vue", "markdown", "python" },
            sync_install = true,
            highlight = { enable = true },
            indent = { enable = true },  
        })
    end
}
