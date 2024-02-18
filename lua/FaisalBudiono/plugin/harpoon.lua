local opts = require("FaisalBudiono.util").create_opts

return {
    "ThePrimeagen/harpoon",
    lazy = true,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("harpoon").setup()
    end,
    keys = {
        { "<leader>a", ":lua require('harpoon.mark').add_file()<cr>", opts("Harpoon add file") },
        { "<c-e>", ":lua require('harpoon.ui').toggle_quick_menu()<cr>" , opts("Harpoon toggle quick menu")},
        { "<A-1>", ":lua require('harpoon.ui').nav_file(1)<cr>" , opts("Harpoon goto file 1")},
        { "<A-2>", ":lua require('harpoon.ui').nav_file(2)<cr>" , opts("Harpoon goto file 2")},
        { "<A-3>", ":lua require('harpoon.ui').nav_file(3)<cr>" , opts("Harpoon goto file 3")},
        { "<A-4>", ":lua require('harpoon.ui').nav_file(4)<cr>" , opts("Harpoon goto file 4")},
        { "<A-n>", ":lua require('harpoon.ui').nav_next()<cr>" , opts("Harpoon next pin")},
        { "<A-p>", ":lua require('harpoon.ui').nav_prev()<cr>" , opts("Harpoon previous pin")},
    },
}
