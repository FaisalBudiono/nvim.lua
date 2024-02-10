local function copyfilePath()
    vim.cmd('let @+ = expand("%:~:.")')
end
vim.api.nvim_create_user_command('Ccopyfilepath', copyfilePath, { nargs='?' })

