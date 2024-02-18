local M = {}

M.get_visual = function()
    local s_start = vim.fn.getpos("v")
    local s_end = vim.fn.getpos(".")
    return vim.api.nvim_buf_get_text(0, s_start[2] - 1, s_start[3] - 1, s_end[2] - 1, s_end[3], {})
end

return M
