local function cgg()
    vim.cmd('Git log --oneline --pretty=oneline --graph')
end
vim.api.nvim_create_user_command('Cgg', cgg, { nargs='?' })

local function cggv()
    vim.cmd('Git log --pretty=full --graph')
end
vim.api.nvim_create_user_command('Cggv', cggv, { nargs='?' })

local function cggvv()
    vim.cmd('Git log --pretty=fuller --graph')
end
vim.api.nvim_create_user_command('Cggvv', cggvv, { nargs='?' })

