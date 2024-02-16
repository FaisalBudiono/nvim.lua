return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = true,
    keys = {
        { "<leader>ee", ":NvimTreeFindFileToggle<CR>" },
    },
    config = function()
        local nvimtree = require("nvim-tree")

        -- recommended settings from nvim-tree documentation
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- change color for arrows in tree to light blue
        vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
        vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

        local function on_attach(bufnr)
            local api = require("nvim-tree.api")
            local keymap = vim.keymap -- for conciseness

            local function opts(desc)
                return {
                    desc = "nvim-tree: " .. desc,
                    buffer = bufnr,
                    noremap = true,
                    silent = true,
                    nowait = true,
                }
            end

            -- default mappings
            api.config.mappings.default_on_attach(bufnr)

            -- custom mappings
            keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
            keymap.set("n", "l", api.node.open.edit, opts("Open"))
        end

        -- configure nvim-tree
        nvimtree.setup({
            view = {
                width = 35,
                relativenumber = true,
            },
            -- change folder arrow icons
            renderer = {
                indent_markers = {
                    enable = true,
                },
                icons = {
                    glyphs = {
                        folder = {
                            arrow_closed = "", -- arrow when folder is closed
                            arrow_open = "", -- arrow when folder is open
                        },
                    },
                },
            },
            -- disable window_picker for
            -- explorer to work well with
            -- window splits
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                },
            },
            git = {
                ignore = true,
            },
            on_attach = on_attach,
        })

        -- set keymaps
        local keymap = vim.keymap -- for conciseness

        keymap.set(
            "n",
            "<leader>ec",
            "<cmd>NvimTreeCollapse<CR>",
            { desc = "Collapse file explorer" }
        ) -- collapse file explorer
        keymap.set(
            "n",
            "<leader>er",
            "<cmd>NvimTreeRefresh<CR>",
            { desc = "Refresh file explorer" }
        ) -- refresh file explorer
    end,
}
