return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    dependencies = {
        "nvim-lualine/lualine.nvim",
    },
    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            integrations = {
                -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
                gitsigns = true,
            },
        })

        -- setup must be called before loading
        vim.cmd.colorscheme("catppuccin-macchiato")
    end,
}
