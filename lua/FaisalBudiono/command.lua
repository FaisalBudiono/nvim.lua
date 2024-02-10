function CcopyFilePath()
    vim.cmd('let @+ = expand("%:~:.")')
end

