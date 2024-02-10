local function ccfp()
    vim.cmd('let @+ = expand("%:~:.")')
end
vim.api.nvim_create_user_command('Ccfp', ccfp, { nargs='?' })
