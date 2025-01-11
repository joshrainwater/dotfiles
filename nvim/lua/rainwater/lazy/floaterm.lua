return {
    'voldikss/vim-floaterm',
    config = function()
        vim.g.floaterm_width = 0.75
        vim.g.floaterm_height = 0.75
        vim.keymap.set('n', '<F5>', ':FloatermToggle<CR>')
        vim.keymap.set('t', '<F5>', '<C-\\><C-n>:FloatermToggle<CR>')
    end
}
