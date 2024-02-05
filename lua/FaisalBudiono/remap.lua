vim.g.mapleader = " "

vim.keymap.set("n", "<leader>ee", vim.cmd.Ex)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Copy to system: Need XClip
-- Open healthcheck for more info (:checkhealth)
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

