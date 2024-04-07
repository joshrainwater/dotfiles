return {
    "nvim-treesitter/nvim-treesitter",

    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects"
    },

    build = ":TSUpdate",

    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "css",
                "html",
                "go",
                "gomod",
                "javascript",
                "lua",
                "markdown",
                "php",
                "python",
                "query",
                "typescript",
                "vim",
                "vimdoc",
                "vue",
            },
            sync_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = true,
            },
            -- context_commentstring = { enable = true },
            indent = { enable = true },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ['if'] = '@function.inner',
                        ['af'] = '@function.outer',
                        ['ia'] = '@parameter.inner',
                        ['aa'] = '@parameter.outer',
                    }
                }
            }
        })
    end
}
