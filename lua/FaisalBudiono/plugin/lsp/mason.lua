return {
    "williamboman/mason.nvim",
    lazy = true,
    cmd = { "Mason" },
    event = { "VeryLazy" },
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        -- import mason
        local mason = require("mason")

        -- import mason-lspconfig
        local mason_lspconfig = require("mason-lspconfig")

        local mason_tool_installer = require("mason-tool-installer")

        -- enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_lspconfig.setup()

        mason_tool_installer.setup({
            ensure_installed = {
                "json-lsp",
                "yaml-language-server",
                "intelephense",
                "lua-language-server",
                "typescript-language-server",
                "tailwindcss-language-server",
                "php-cs-fixer",
                "prettier",
                "stylua",
                "eslint_d",
                "selene",
                "docker-compose-language-service",
                "dockerfile-language-server",
                "bash-language-server",
                "shfmt",
            },
        })

        vim.cmd("MasonToolsInstall")
    end,
}
