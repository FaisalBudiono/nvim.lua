return {
    {
        "nvim-lualine/lualine.nvim",
        lazy = true,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "catppuccin",
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = { "filename" },
                    lualine_x = { "encoding", "fileformat", "filetype" },

                    lualine_y = {
                        -- LSP Bar
                        {
                            function()
                                local defaultMessage = "No Active LSP"
                                local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                                local clients = vim.lsp.get_active_clients()
                                if next(clients) == nil then
                                    return defaultMessage
                                end

                                local msg = ""
                                for _, client in ipairs(clients) do
                                    local filetypes = client.config.filetypes
                                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                                        msg = msg .. " - " .. client.name
                                    end
                                end

                                if #msg == 0 then
                                    return defaultMessage
                                end

                                return string.sub(msg, 4, #msg)
                            end,
                            icon = " ",
                            color = { fg = "#ffffff", gui = "bold" },
                        },
                    },

                    lualine_z = { "location" },
                },
            })

            -- Hide Mode in Bottom
            vim.opt.showmode = false
        end,
    },
}
