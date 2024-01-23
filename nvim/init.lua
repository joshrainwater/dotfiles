-- My neovim config is conglomeration of:
-- thePrimeagen
-- nvim-lua/kickstart
-- https://laracasts.com/series/neovim-as-a-php-ide
-- My own custom pieces that I liked from experimenting around.

-- Set <space> as the leader key
-- Before everything else happens
vim.g.mapleader = " "

-- [[Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure plugins ]]
require("lazy").setup({
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

    -- The fuzzy finder is basically a requirement
    {"nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons"
        }
    },
    {"windwp/nvim-autopairs", 
        config = function ()
            require("nvim-autopairs").setup({
                event = "InsertEnter"
            })
        end
    },
    {"mbbill/undotree"},
    {"nvim-treesitter/nvim-treesitter",
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
    },
   
    {"folke/trouble.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        opts = {}
    },

    {"folke/noice.nvim", 
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
    },

    -- Lets see how this goes...
    {"Exafunction/codeium.vim",
        event = "BufEnter",
    },

    -- Colors
    {"folke/tokyonight.nvim"},
})

require("lsp")
require("plugins")
require("set")
require("remap")

-- ColorScheme Setup
require('tokyonight').setup({
    style = 'storm',
})
vim.cmd("colorscheme tokyonight")
vim.api.nvim_set_hl(50, "Normal", { bg = "none" })
vim.api.nvim_set_hl(50, "NormalFloat", { bg = "none" })
