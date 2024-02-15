return {
    "tpope/vim-fugitive",
    lazy = true,
    keys = {
        {
            "<leader>ggg",
            function()
                vim.cmd("Git")
                vim.cmd("wincmd L")
            end,
            desc = "Open Git fugitive",
        },
    },
}
