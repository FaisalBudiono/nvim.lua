return {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    branch = "0.1.x",
    event = { "LspAttach" },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "BurntSushi/ripgrep",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        },
    },
    keys = {
        { "<C-p>", ":lua require('telescope.builtin').git_files()<cr>" },
        {
            "<leader>ps",
            function()
                require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
            end,
        },
        { "<leader>pS", ":lua require('telescope.builtin').live_grep()<cr>" },
        { "<leader>pf", ":lua require('telescope.builtin').find_files({hidden=true})<cr>" },
        { "<leader><Bslash>", ":lua require('telescope.builtin').keymaps()<cr>" },
        { "<leader>ghb", ":lua require('telescope.builtin').git_bcommits()<cr>" },
        { "<leader>ghh", ":lua require('telescope.builtin').git_commits()<cr>" },
    },
    config = function()
        require("telescope").load_extension("fzf")
    end,
}
