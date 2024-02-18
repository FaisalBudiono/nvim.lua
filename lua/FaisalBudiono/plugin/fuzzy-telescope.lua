local opts = require("FaisalBudiono.util").create_opts

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
        {
            "<C-p>",
            ":lua require('telescope.builtin').git_files()<cr>",
            opts("Open telescope fuzzy finder for git files"),
        },
        {
            "<leader>ps",
            function()
                require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
            end,
            mode = { "n" },
            opts("Open telescope grep string"),
        },
        {
            "<leader>ps",
            function()
                require("telescope.builtin").grep_string({
                    search = require("FaisalBudiono.util").get_visual()[1],
                })
            end,
            mode = { "v" },
            opts("Open telescope grep string from visual mode"),
        },
        {
            "<leader>pS",
            ":lua require('telescope.builtin').live_grep()<cr>",
            opts("open telescope live grep"),
        },
        {
            "<leader>pf",
            ":lua require('telescope.builtin').find_files({hidden=true,no_ignore=true})<cr>",
            opts("Open telescope fuzzy finder for all file"),
        },
        {
            "<leader><Bslash>",
            ":lua require('telescope.builtin').keymaps()<cr>",
            opts("Open telescope listing all keymap"),
        },
        {
            "<leader>ghb",
            ":lua require('telescope.builtin').git_bcommits()<cr>",
            opts("Open telescope git file change"),
        },
        {
            "<leader>ghh",
            ":lua require('telescope.builtin').git_commits()<cr>",
            opts("Open telescope git history"),
        },
    },
    config = function()
        require("telescope").load_extension("fzf")
    end,
}
