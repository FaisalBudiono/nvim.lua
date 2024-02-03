local gs = require('gitsigns')

gs.setup()

vim.keymap.set('n', '<leader>gb', function() gs.blame_line{full=true} end)

