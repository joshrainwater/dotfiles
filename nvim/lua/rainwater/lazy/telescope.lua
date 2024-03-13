return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope-live-grep-args.nvim",
    },
    config = function()
        require("telescope").setup({
            defaults = {
                path_display = { "smart" },
            }
        })

        -- Telescope live_grep in git root
        -- Function to find the git root directory based on the current buffer's path
        local function find_git_root()
            -- Use the current buffer's path as the starting point for the git search
            local current_file = vim.api.nvim_buf_get_name(0)
            local current_dir
            local cwd = vim.fn.getcwd()
            -- If the buffer is not associated with a file, return nil
            if current_file == "" then
                current_dir = cwd
            else
                -- Extract the directory from the current file's path
                current_dir = vim.fn.fnamemodify(current_file, ":h")
            end

            -- Find the Git root directory from the current file's path
            local git_root = vim.fn.systemlist("git -C " ..
            vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
            if vim.v.shell_error ~= 0 then
                print("Not a git repository. Searching on current working directory")
                return cwd
            end
            return git_root
        end

        -- Custom live_grep function to search in git root
        local function live_grep_git_root()
            local git_root = find_git_root()
            if git_root then
                require('telescope.builtin').live_grep({
                    search_dirs = { git_root },
                })
            end
        end

        vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

        local builtin = require("telescope.builtin")

        vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = "[S]earch All [F]iles" })
        -- vim.keymap.set('n', '<leader>sF', function() builtin.find_files({no_ignore = true, hidden = true}) end, {desc = "[S]earch All [F]iles"})
        vim.keymap.set('n', '<leader>sg', builtin.git_files, { desc = "[S]earch [G]it Files" })
        vim.keymap.set('n', '<leader>so', builtin.oldfiles, { desc = "[S]earch [O]ld Files" })
        vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = "[S]earch [W]ord" })
        -- vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = "[S]earch [G]rep on Git Root"})
        vim.keymap.set('n', '<leader>sG', function() require('telescope').extensions.live_grep_args.live_grep_args() end,
            { desc = "[S]earch [G]rep on Git Root" })
        vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = "[R]esume last Telescope Search" })
        vim.keymap.set('n', '<leader>ss', builtin.lsp_document_symbols, { desc = "[S]earch [S]ymbols" })
    end
}
