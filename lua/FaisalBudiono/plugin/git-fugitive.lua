local opts = require("FaisalBudiono.util").create_opts

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
            opts("Open Git fugitive"),
        },
    },
}
