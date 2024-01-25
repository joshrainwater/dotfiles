vim.keymap.set("n", "<leader>of", vim.cmd.Ex)

-- Remap indentation to keep highlight
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move selected lines up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Maintain cursor position when yanking
vim.keymap.set("v", "y", "myy`y")

-- Global copy-paste to clipboard.
-- I don't think this works in WSL
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Easy append of semicolon and comma at end of line
vim.keymap.set("i", ";;", "<Esc>A;")
vim.keymap.set("i", ",,", "<Esc>A,")

vim.keymap.set("n", "Q", "<nop>")

-- NvimTreeToggle
vim.keymap.set("n", "<leader>n", vim.cmd.NvimTreeFindFileToggle)

-- Quickfix menu
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<C-q>", vim.cmd.cclose)

-- Replace all occurences
vim.keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- [[ Telescope-specific keybindings ]]

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
  local git_root = vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
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
      search_dirs = {git_root},
    })
  end
end

vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

local builtin = require("telescope.builtin")

vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = "[S]earch All [F]iles"})
vim.keymap.set('n', '<leader>sg', builtin.git_files, { desc = "[S]earch [G]it Files" })
vim.keymap.set('n', '<leader>so', builtin.oldfiles, { desc = "[S]earch [O]ld Files"})
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = "[S]earch [W]ord"})
vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = "[S]earch [G]rep on Git Root"})
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = "[R]esume last Telescope Search"})
vim.keymap.set('n', '<leader>ss', builtin.lsp_document_symbols, { desc = "[S]earch [S]ymbols"})
-- LazyGit --
vim.keymap.set('n', '<leader>og', ':LazyGit<cr>', { desc = "Open LazyGit" })
