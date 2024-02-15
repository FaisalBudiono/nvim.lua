return {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "williamboman/mason.nvim",
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local mason_lspconfig = require("mason-lspconfig")

        local keymap = vim.keymap -- for conciseness

        local opts = { noremap = true, silent = true }
        local on_attach = function(_, bufnr)
            opts.buffer = bufnr

            -- set keybinds
            opts.desc = "LSP go to definition"
            keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            opts.desc = "LSP go to definition with Telescope"
            keymap.set("n", "gD", ":Telescope lsp_definitions<CR>", opts)

            opts.desc = "Show LSP references"
            keymap.set("n", "gr", vim.lsp.buf.references, opts)
            opts.desc = "Show LSP references with Telescope"
            keymap.set("n", "gR", ":Telescope lsp_references<CR>", opts)

            opts.desc = "Show line diagnostic"
            keymap.set("n", "<leader>ldh", vim.diagnostic.open_float, opts)

            opts.desc = "Show Trouble document diagnostic"
            keymap.set("n", "<leader>ldd", ":Trouble document_diagnostics<CR>", opts)
            opts.desc = "Show Trouble workspace diagnostic"
            keymap.set("n", "<leader>ldw", ":Trouble workspace_diagnostics<CR>", opts)

            opts.desc = "Show LSP hover doc"
            keymap.set("n", "K", vim.lsp.buf.hover, opts)

            opts.desc = "Rename variable"
            keymap.set("n", "<leader>lrn", vim.lsp.buf.rename, opts)

            opts.desc = "LSP code action"
            keymap.set("n", "<leader>l.", vim.lsp.buf.code_action, opts)

            opts.desc = "Go to previous diagnostic"
            keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

            opts.desc = "Go to next diagnostic"
            keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
        end

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Change the Diagnostic symbols in the sign column (gutter)
        local signs = { Error = "", Warn = "", Hint = "", Info = "" }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        mason_lspconfig.setup({
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                    })
                end,

                lua_ls = function()
                    lspconfig["lua_ls"].setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                        settings = { -- custom settings for lua
                            Lua = {
                                -- make the language server recognize "vim" global
                                diagnostics = {
                                    globals = { "vim" },
                                },
                                workspace = {
                                    -- make language server aware of runtime files
                                    library = {
                                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                        [vim.fn.stdpath("config") .. "/lua"] = true,
                                    },
                                },
                            },
                        },
                    })
                end,

                tailwindcss = function()
                    lspconfig["tailwindcss"].setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                        filetypes = {
                            "markdown",
                            "css",
                            "less",
                            "sass",
                            "scss",
                            "javascript",
                            "javascriptreact",
                            "rescript",
                            "typescript",
                            "typescriptreact",
                        },
                    })
                end,
            },
        })
    end,
}
