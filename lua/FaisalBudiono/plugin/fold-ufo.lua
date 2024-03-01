local custom_ft = require("FaisalBudiono.filetype").filetypes

local ftMap = {
    php = { "indent" },
    [custom_ft["yaml.docker-compose"]] = { "indent" },
    yaml = { "indent" },
}

return {
    "kevinhwang91/nvim-ufo",
    lazy = true,
    event = { "VeryLazy" },
    dependencies = {
        "kevinhwang91/promise-async",
    },
    config = function()
        local opts = require("FaisalBudiono.util").create_opts
        local ufo = require("ufo")

        vim.o.foldcolumn = "1" -- '0' is not bad
        vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true

        vim.keymap.set("n", "zR", require("ufo").openAllFolds, opts("Open all folds"))
        vim.keymap.set("n", "zM", require("ufo").closeAllFolds, opts("Close all folds"))
        vim.keymap.set("n", "zK", require("ufo").peekFoldedLinesUnderCursor, opts("Peek fold"))

        local handler = function(virtText, lnum, endLnum, width, truncate)
            local newVirtText = {}
            local suffix = (" 󰁂 %d "):format(endLnum - lnum)
            local sufWidth = vim.fn.strdisplaywidth(suffix)
            local targetWidth = width - sufWidth
            local curWidth = 0
            for _, chunk in ipairs(virtText) do
                local chunkText = chunk[1]
                local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                if targetWidth > curWidth + chunkWidth then
                    table.insert(newVirtText, chunk)
                else
                    chunkText = truncate(chunkText, targetWidth - curWidth)
                    local hlGroup = chunk[2]
                    table.insert(newVirtText, { chunkText, hlGroup })
                    chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    -- str width returned from truncate() may less than 2nd argument, need padding
                    if curWidth + chunkWidth < targetWidth then
                        suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
                    end
                    break
                end
                curWidth = curWidth + chunkWidth
            end
            table.insert(newVirtText, { suffix, "MoreMsg" })
            return newVirtText
        end

        ufo.setup({
            provider_selector = function(_, filetype)
                local selector = ftMap[filetype]

                if selector == nil then
                    selector = { "lsp", "indent" }
                end

                return selector
            end,
            fold_virt_text_handler = handler,
        })
    end,
}
