return {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "BurntSushi/ripgrep",
    },
    keys = {
        { "<C-p>", "<cmd>lua require('telescope.builtin').git_files()<cr>"},
        { "<leader>ps", "<cmd>lua require('telescope.builtin').live_grep()<cr>"},
        { "<leader>pf", "<cmd>lua require('telescope.builtin').find_files()<cr>"},
        { "<leader><Bslash>", "<cmd>lua require('telescope.builtin').keymaps()<cr>"},
        { "<leader>ghb", "<cmd>lua require('telescope.builtin').git_bcommits()<cr>"},
    },
}
