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
        { "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>" },
        { "<c-e>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>" },
        { "<A-1>", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>" },
        { "<A-2>", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>" },
        { "<A-3>", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>" },
        { "<A-4>", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>" },
        { "<A-n>", "<cmd>lua require('harpoon.ui').nav_next()<cr>" },
        { "<A-p>", "<cmd>lua require('harpoon.ui').nav_prev()<cr>" },
        { "<A-t>", "<cmd>lua require('harpoon.term').gotoTerminal(1)<cr>" },
    },
}
