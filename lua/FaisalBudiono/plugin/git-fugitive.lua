return {
    "tpope/vim-fugitive",
    lazy = true,
    keys = {
        {
            "<leader>ggg", 
            function()
                vim.cmd("tabnew")
                vim.cmd("Git")
                vim.cmd("wincmd k")
                vim.cmd("q")
            end,
            desc = "Open Git fugitive",
        },
    },
}
