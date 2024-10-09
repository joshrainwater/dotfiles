-- Turn on "reader" mode
vim.api.nvim_create_user_command('Write', ':set wrap linebreak nolist', {})
vim.api.nvim_create_user_command('Fix', ':set shiftwidth=4 | set tabstop=4', {})

