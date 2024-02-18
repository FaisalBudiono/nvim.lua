local opts = require("FaisalBudiono.util").create_opts

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
            opts("Stage hunk in visual mode"),
        },
        {
            "<leader>gd",
            ":lua require('gitsigns').diffthis()<cr>",
            opts("Git diff between latest and stage"),
        },
        {
            "<leader>gb",
            ":lua require('gitsigns').blame_line()<cr>",
            opts("Git blame line"),
        },
        {
            "<leader>gvb",
            function()
                require("gitsigns").blame_line({ full = true })
            end,
            opts("Git blame line (Verbose)"),
        },
    },
}
