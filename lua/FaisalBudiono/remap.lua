vim.g.mapleader = " "

vim.keymap.set("n", "<leader>ee", vim.cmd.Ex)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Copy to system: Need XClip
-- Open healthcheck for more info (:checkhealth)
vim.keymap.set({"n", "v"}, "<leader>cy", [["+y]])
vim.keymap.set("n", "<leader>cp", [["+p]])
vim.keymap.set("n", "<leader>cP", [["+P]])

vim.keymap.set("n", "<leader>nn", function () vim.cmd(':tabnew') end)
vim.keymap.set("n", "<leader>nl", function () vim.cmd(':vnew') end)
vim.keymap.set("n", "<leader>nj", function () vim.cmd(':new') end)

