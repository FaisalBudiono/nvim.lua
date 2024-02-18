vim.filetype.add({
    pattern = {
        ["docker%-compose[%w_.-]*%.yml"] = "yaml.docker-compose",
    },
})
