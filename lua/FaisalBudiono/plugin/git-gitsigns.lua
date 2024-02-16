return {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    config = function()
        require("gitsigns").setup()
    end,
    keys = {
        {
            "<leader>gsa",
            function()
                require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end,
            mode = { "v" },
        },
        { "<leader>gd", ":lua require('gitsigns').diffthis()<cr>" },
        { "<leader>gb", ":lua require('gitsigns').blame_line()<cr>" },
        {
            "<leader>gvb",
            function()
                require("gitsigns").blame_line({ full = true })
            end,
        },
    },
}
