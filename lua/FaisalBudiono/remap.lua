vim.g.mapleader = " "

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Copy to system: Need XClip
-- Open healthcheck for more info (:checkhealth)
vim.keymap.set({"n", "v"}, "<leader>`", [["_]])
vim.keymap.set({"n", "v"}, "<leader>cy", [["+y]])
vim.keymap.set("n", "<leader>cp", [["+p]])
vim.keymap.set("n", "<leader>cP", [["+P]])

vim.keymap.set("n", "<leader>nn", function () vim.cmd(':tabnew') end)
vim.keymap.set("n", "<leader>nl", function () vim.cmd(':vnew') end)
vim.keymap.set("n", "<leader>nj", function () vim.cmd(':new') end)

--
-- Windows Size Manipulation
--
vim.keymap.set("n", "<leader>w=", "<c-w>=")
vim.keymap.set("n", "<leader>w<s-m>", "100<c-w>+")
vim.keymap.set("n", "<leader>wm", "100<c-w>-")

--
-- Visual Mode
--
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
