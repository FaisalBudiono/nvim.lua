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
        { "<leader>a", ":lua require('harpoon.mark').add_file()<cr>" },
        { "<c-e>", ":lua require('harpoon.ui').toggle_quick_menu()<cr>" },
        { "<A-1>", ":lua require('harpoon.ui').nav_file(1)<cr>" },
        { "<A-2>", ":lua require('harpoon.ui').nav_file(2)<cr>" },
        { "<A-3>", ":lua require('harpoon.ui').nav_file(3)<cr>" },
        { "<A-4>", ":lua require('harpoon.ui').nav_file(4)<cr>" },
        { "<A-n>", ":lua require('harpoon.ui').nav_next()<cr>" },
        { "<A-p>", ":lua require('harpoon.ui').nav_prev()<cr>" },
        { "<A-t>", ":lua require('harpoon.term').gotoTerminal(1)<cr>" },
    },
}
