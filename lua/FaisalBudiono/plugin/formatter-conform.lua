local config_fts = {
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescriptreact = { "prettierd" },
    svelte = { "prettierd" },
    css = { "prettierd" },
    html = { "prettierd" },
    json = { "prettierd" },
    yaml = { "prettierd" },
    markdown = { "prettierd" },
    graphql = { "prettierd" },
    lua = { "stylua" },
    php = { "php" },
    sh = { "shfmt" },
    go = { "gofumpt", "goimports" },
    templ = { "templ" },
    sql = { "sql" },
    mysql = { "sql" },
    rust = { "rustfmt" },
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
        local opts = require("FaisalBudiono.util").create_opts
        local conform = require("conform")

        local file_config_php = vim.fn.stdpath("config") .. "/lua/FaisalBudiono/formatters/php.php"
        local file_config_sql = vim.fn.stdpath("config")
            .. "/lua/FaisalBudiono/formatters/sql-formatter.json"

        local format_config = {
            lsp_format = "fallback",
            async = false,
            timeout_ms = 2500,
        }

        conform.setup({
            formatters_by_ft = config_fts,
            formatters = {
                php = {
                    command = "php-cs-fixer",
                    args = function(self, ctx)
                        return {
                            "fix",
                            -- "$FILENAME",
                            ctx.filename,
                            "--config=" .. file_config_php,
                            "--allow-risky=yes", -- if you have risky stuff in config, if not you dont need it.
                        }
                    end,
                    stdin = false,
                },
                sql = {
                    command = "sql-formatter",
                    args = function(self, ctx)
                        return {
                            "--config=" .. file_config_sql,
                            "-l=mysql",
                        }
                    end,
                    stdin = true,
                },
            },
            default_format_opts = {
                lsp_format = "first",
            },
        })

        vim.keymap.set({ "n", "v" }, "<leader>lf", function()
            conform.format(format_config)
        end, opts("Format file or range (in visual mode)"))
    end,
}
