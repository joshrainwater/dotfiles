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
-- Windows version
vim.keymap.set("v", "<leader>y", ":w !clip.exe<CR><CR>")
-- vim.keymap.set("n", "<leader>y", "\"+y")
-- vim.keymap.set("v", "<leader>y", "\"+y")
-- vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Easy append of semicolon and comma at end of line
vim.keymap.set("i", ";;", "<Esc>A;")
vim.keymap.set("i", ",,", "<Esc>A,")

vim.keymap.set("n", "Q", "<nop>")

-- Quickfix menu
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<C-q>", vim.cmd.cclose)

-- Replace all occurences
vim.keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
