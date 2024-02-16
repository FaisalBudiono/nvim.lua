return {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        vim.diagnostic.config({
            virtual_text = false,
        })

        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local mason_lspconfig = require("mason-lspconfig")

        local keymap = vim.keymap -- for conciseness

        local on_attach = function(_, bufnr)
            local function opts(desc)
                return { noremap = true, silent = true, buffer = bufnr, desc = desc }
            end

            -- set keybinds
            keymap.set("n", "gd", vim.lsp.buf.definition, opts("LSP go to definition"))
            keymap.set(
                "n",
                "gD",
                ":Telescope lsp_definitions<CR>",
                opts("LSP go to definition with Telescope")
            )

            keymap.set("n", "gr", vim.lsp.buf.references, opts("Show LSP references"))
            keymap.set(
                "n",
                "gR",
                ":Telescope lsp_references<CR>",
                opts("Show LSP references with Telescope")
            )

            keymap.set("n", "<leader>ldh", vim.diagnostic.open_float, opts("Show line diagnostic"))

            keymap.set(
                "n",
                "<leader>ldd",
                ":Trouble document_diagnostics<CR>",
                opts("Show Trouble document diagnostic")
            )
            keymap.set(
                "n",
                "<leader>ldw",
                ":Trouble workspace_diagnostics<CR>",
                opts("Show Trouble workspace diagnostic")
            )
            keymap.set("n", "K", vim.lsp.buf.hover, opts("Show LSP hover doc"))

            keymap.set("n", "<leader>lrn", vim.lsp.buf.rename, opts("Rename variable"))

            keymap.set("n", "<leader>l.", vim.lsp.buf.code_action, opts("LSP code action"))

            keymap.set("n", "[d", vim.diagnostic.goto_prev, opts("Go to previous diagnostic"))
            keymap.set("n", "]d", vim.diagnostic.goto_next, opts("Go to next diagnostic"))
        end

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Change the Diagnostic symbols in the sign column (gutter)
        local signs = { Error = "", Warn = "", Hint = "", Info = "" }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        mason_lspconfig.setup_handlers({
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
        })
    end,
}
