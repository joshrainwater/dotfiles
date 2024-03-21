return {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    config = function ()
        vim.keymap.set('i', '<C-y>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
        vim.keymap.set('i', '<C-j>', function () return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
        vim.keymap.set('i', '<C-k>', function () return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
        vim.keymap.set('i', '<C-x>', function () return vim.fn['codeium#Clear']() end, { expr = true, silent = true })

        vim.g.codeium_disable_bindings = true
        vim.g.codeium_manual = true

    end,
    opts = {
        no_default_keymaps = true
    }
}
