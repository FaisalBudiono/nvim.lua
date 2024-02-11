return {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "BurntSushi/ripgrep",
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
        },
    },
    keys = {
        { "<C-p>", "<cmd>lua require('telescope.builtin').git_files()<cr>"},
        { "<leader>ps", "<cmd>lua require('telescope.builtin').live_grep()<cr>"},
        { "<leader>pf", "<cmd>lua require('telescope.builtin').find_files()<cr>"},
        { "<leader><Bslash>", "<cmd>lua require('telescope.builtin').keymaps()<cr>"},
        { "<leader>ghb", "<cmd>lua require('telescope.builtin').git_bcommits()<cr>"},
        { "<leader>ghh", "<cmd>lua require('telescope.builtin').git_commits()<cr>"},
    },
    config = function()
        require("telescope").load_extension("fzf")
    end
}
