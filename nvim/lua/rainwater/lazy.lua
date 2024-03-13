return {
    -- Git related plugins
    {"kdheepak/lazygit.nvim",
        config = function ()
            vim.keymap.set('n', '<leader>og', ':LazyGit<cr>', { desc = "Open LazyGit" })
        end
    },

    -- Extra snippets
    {'rafamadriz/friendly-snippets'},

    -- This is one I'm not sure I want to keep yet.
    -- {"windwp/nvim-autopairs",
    --     config = function ()
    --         require("nvim-autopairs").setup({
    --             event = "InsertEnter"
    --         })
    --     end
    -- },
    {"mbbill/undotree"},

    {"tpope/vim-commentary"},
    {"tpope/vim-sleuth"},
    {"whatyouhide/vim-textobj-xmlattr",
        dependencies = {
            "kana/vim-textobj-user"
        }
    },
}
