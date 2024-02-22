return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'j-hui/fidget.nvim',
    },
    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require('cmp_nvim_lsp')
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require('fidget').setup()
        require('mason').setup()
        require('mason-lspconfig').setup({
            automatic_installation = true,
            ensure_installed = {
                "lua_ls",
                "html",
                "cssls",
                "phpactor",
                "volar",
                "tailwindcss",
                --"gdscript"
            },
            handlers = {
                function(server_name) -- default handler (optional)

                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,

                ["volar"] = function ()
                    local lspconfig = require('lspconfig')
                    lspconfig.volar.setup({
                        capabilities = capabilities,
                        filetypes = {'typescript', 'javascript', 'vue', 'json'}
                    })
                end,

                ["phpactor"] = function()
                    local lspconfig = require('lspconfig')
                    local home = os.getenv('HOME')
                    local dotfiles = os.getenv('DOTFILES')

                    lspconfig.phpactor.setup({
                        capabilities = capabilities,
                        init_options = {
                            ["language_server_psalm.enabled"] = false,
                            ["language_server_php_cs_fixer.enabled"] = true,
                            ["language_server_php_cs_fixer.bin"] = home .. "/.local/bin/php-cs-fixer",
                            ["language_server_php_cs_fixer.config"] = dotfiles .. "/php/php-cs-fixer.laravel.php"
                        }
                     })
                end
            }
        })

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
        vim.keymap.set('n', '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>')
        vim.keymap.set('x', '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>')
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')

        if vim.lsp.buf.range_code_action then
        vim.keymap.set('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
        else
        vim.keymap.set('x', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
        end

        vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
        vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
        vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')


        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
                ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
