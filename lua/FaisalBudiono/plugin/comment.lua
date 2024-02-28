return {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local comment = require("Comment")

        comment.setup()

        local ft = require("Comment.ft")
        local filetypes = require("FaisalBudiono.filetype").filetypes

        ft({filetypes["eraser-diagram"]}, "//%s")
    end,
}
