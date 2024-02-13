return {
    -- Git related plugins
    {"kdheepak/lazygit.nvim"},

    -- Extra snippets
    {'rafamadriz/friendly-snippets'},

    -- This is one I'm not sure I want to keep yet.
    {"windwp/nvim-autopairs", 
        config = function ()
            require("nvim-autopairs").setup({
                event = "InsertEnter"
            })
        end
    },
    {"mbbill/undotree"},
   
    {"tpope/vim-commentary"},
    {"tpope/vim-sleuth"},
    {"whatyouhide/vim-textobj-xmlattr",
        dependencies = {
            "kana/vim-textobj-user"
        }
    },
}
