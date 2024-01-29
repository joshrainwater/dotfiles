return {
    -- Git related plugins
    {"kdheepak/lazygit.nvim"},

    -- Everything related to LSP
    {'neovim/nvim-lspconfig',
        dependencies = {
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            {'j-hui/fidget.nvim', opts = {} },
            {'folke/neodev.nvim'},
        }
    },
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},

    -- Autocompletion
    {'hrsh7th/nvim-cmp', 
        dependencies = {
            {'L3MON4D3/LuaSnip'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'rafamadriz/friendly-snippets'},
        }
    },

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

    -- Colors
    {"folke/tokyonight.nvim"},
}
