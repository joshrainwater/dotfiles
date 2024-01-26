-- ColorScheme Setup
require('tokyonight').setup({
    style = 'storm',
})
vim.cmd("colorscheme tokyonight")

-- I don't think this works in WSL
vim.api.nvim_set_hl(50, "Normal", { bg = "none" })
vim.api.nvim_set_hl(50, "NormalFloat", { bg = "none" })
