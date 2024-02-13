local config_fts = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    svelte = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    graphql = { "prettier" },
    lua = { "stylua" },
    php = { "php_cs_fixer" },
}

local fts = {}
for ft in pairs(config_fts) do
    table.insert(fts, ft)
end

return {
    "stevearc/conform.nvim",
    ft = fts,
    dependencies = {
        "williamboman/mason.nvim",
    },
    config = function()
        local conform = require("conform")

        local format_on_save =
            {
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            }, conform.setup({
                formatters_by_ft = config_fts,
                format_on_save = format_on_save,
            })

        vim.keymap.set({ "n", "v" }, "<leader>lf", function()
            conform.format(format_on_save)
        end, { desc = "Format file or range (in visual mode)" })
    end,
}