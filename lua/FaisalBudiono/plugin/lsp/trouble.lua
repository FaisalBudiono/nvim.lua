return {
    "folke/trouble.nvim",
    event = { "LspAttach" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local trouble = require("trouble")
        local util = require("FaisalBudiono.util")

        trouble.setup()

        vim.keymap.set("n", "[d", function()
            pcall(trouble.previous, { skip_groups = true, jump = true })
        end, util.create_opts("Go to previous diagnostic"))

        vim.keymap.set("n", "]d", function()
            pcall(trouble.next, { skip_groups = true, jump = true })
        end, util.create_opts("Go to next diagnostic"))
    end,
}
