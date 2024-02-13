return {
    'lewis6991/gitsigns.nvim',
    config = function()
        require('gitsigns').setup()
        vim.keymap.set('n', 'gb', ':Gitsigns blame_line<CR>')
        vim.keymap.set('n', 'gp', ':Gitsigns preview_hunk<CR>')
        -- There are a lot more keybinding options; I current use lazygit
        -- frequently so I don't find too much use for them... yet.
    end
}
