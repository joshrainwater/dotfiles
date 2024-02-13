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
