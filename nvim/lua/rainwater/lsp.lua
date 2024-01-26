local lsp_zero = require('lsp-zero')
lsp_zero.preset("recommended")

local cmp = require("cmp")
local cmp_action = require('lsp-zero').cmp_action()
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-Space>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    })
})

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp_zero-zero-keybindings
  -- to learn the available actions
    lsp_zero.default_keymaps({
        buffer = bufnr,
        preserve_mappings = false
    })
end)

lsp_zero.setup_servers({'html', 'cssls', 'eslint', 'phpactor', 'volar', 'gdscript'})

local home = os.getenv('HOME')
local dotfiles = os.getenv('DOTFILES')
print( dotfiles .. "/php/php-cs-fixer.laravel.php"
)
require('lspconfig').phpactor.setup({
    on_attach = on_attach,
    init_options = {
        ["language_server_psalm.enabled"] = false,
        ["language_server_php_cs_fixer.enabled"] = true,
        ["language_server_php_cs_fixer.bin"] = home .. "/.local/bin/php-cs-fixer",
        ["language_server_php_cs_fixer.config"] = dotfiles .. "/php/php-cs-fixer.laravel.php"
    }
 })

