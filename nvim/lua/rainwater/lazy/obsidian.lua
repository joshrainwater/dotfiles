return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    -- ft = "markdown",
    event = {
        "BufReadPre " .. vim.fn.expand "~" .. "/code/second-brain/*.md",
        "BufNewFile " .. vim.fn.expand "~" .. "/code/second-brain/*.md",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "second-brain",
                path = "~/code/second-brain"
            },
        },
    },
}
