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

    -- The fuzzy finder is basically a requirement
    {"nvim-telescope/telescope.nvim",
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
   
    {"tpope/vim-commentary"},
    {"tpope/vim-sleuth"},
    {"whatyouhide/vim-textobj-xmlattr",
        dependencies = {
            "kana/vim-textobj-user"
        }
    },
    {"AndrewRadev/splitjoin.vim",
        config = function()
            vim.g.splitjoin_trailing_comma = 1
            vim.g.splitjoin_php_method_chain_full = 1
        end
    },
    {"nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"      
        },
        opts = {
            options = {
                section_separators = '',
                component_separators = '',
                globalstatus = true,
                theme = {
                    normal = {
                        a = 'StatusLine',
                        b = 'StatusLine',
                        c = 'StatusLine',
                    },
                },
            },
            sections = {
              lualine_a = {
                'mode',
              },
              lualine_b = {
                'branch',
                {
                  'diff',
                  symbols = { added = ' ', modified = ' ', removed = ' ' },
                },
                -- function ()
                --   return '󰅭 ' .. vim.pesc(tostring(#vim.tbl_keys(vim.lsp.buf_get_clients())) or '')
                -- end,
                -- { 'diagnostics', sources = { 'nvim_diagnostic' } },
              },
              lualine_c = {
                'filename'
              },
              lualine_x = {
                {
                  require("lazy.status").updates,
                  cond = require("lazy.status").has_updates,
                  color = { fg = "#ff9e64" },
                },
              },
              lualine_y = {
                'filetype',
                'encoding',
                --'fileformat',
                --'(vim.bo.expandtab and "␠ " or "⇥ ") .. vim.bo.shiftwidth',
              },
              lualine_z = {
                'searchcount',
                'selectioncount',
                'location',
                'progress',
              },
            },
        },
    },

    -- {"nvim-tree/nvim-tree.lua",
    --     dependencies = {
    --         "nvim-tree/nvim-web-devicons"      
    --     },
    --     config = function ()
    --         require("nvim-tree").setup({
    --            renderer = {
    --                 group_empty = true,
    --                 icons = {
    --                     show = {
    --                         folder_arrow = false
    --                     }
    --                 },
    --                 indent_markers = {
    --                     enable = true
    --                 }
    --            }  
    --         })
    --     end
    -- },
    {"folke/trouble.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        opts = {}
    },

    {"Exafunction/codeium.vim",
        event = "BufEnter",
        config = function ()
            vim.keymap.set('i', '<C-Space>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
            vim.keymap.set('i', '<C-j>', function () return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
            vim.keymap.set('i', '<C-k>', function () return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
            vim.keymap.set('i', '<C-x>', function () return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
        end,
        opts = {
            no_default_keymaps = true
        }
    },

    -- Colors
    {"folke/tokyonight.nvim"},
}
