local gs = require('gitsigns')

gs.setup()

vim.keymap.set('n', '<leader>gb', function() gs.blame_line{full=true} end)

vim.keymap.set('n', '<leader>ghh', gs.preview_hunk)
vim.keymap.set('n', '<leader>ghn', gs.next_hunk)
vim.keymap.set('n', '<leader>ghp', gs.prev_hunk)

vim.keymap.set('n', '<leader>gsd', gs.diffthis)
vim.keymap.set('v', '<leader>gsa', function()
    gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')}
end)
