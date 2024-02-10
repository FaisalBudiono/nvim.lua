return {
    {
        "nvim-lualine/lualine.nvim",
        lazy = true,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require('lualine').setup({
                options = {
                    theme = "catppuccin"
                },
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'branch', 'diff', 'diagnostics'},
                    lualine_c = {
                        function()
                            local relativePath = vim.fn.expand("%:~:.")
                            return relativePath
                        end,
                    },
                    lualine_x = {'encoding', 'fileformat', 'filetype'},

                    lualine_y = {
                        -- LSP Bar
                        {
                            function()
                                local msg = 'No Active LSP'
                                local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                                local clients = vim.lsp.get_active_clients()
                                if next(clients) == nil then
                                    return msg
                                end
                                for _, client in ipairs(clients) do
                                    local filetypes = client.config.filetypes
                                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                                        return client.name
                                    end
                                end
                                return msg
                            end,
                            icon = ' LSP:',
                            color = { fg = '#ffffff', gui = 'bold' },
                        }
                    },

                    lualine_z = {'location'}
                },
            })

            -- Hide Mode in Bottom
            vim.opt.showmode = false
        end
    },
}
