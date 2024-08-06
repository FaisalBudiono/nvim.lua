return {
    filetypes = {
        "css",
        "html",
        "javascript",
        "javascriptreact",
        "less",
        "markdown",
        "rescript",
        "sass",
        "scss",
        "templ",
        "typescript",
        "typescriptreact",
    },
    settings = {
        tailwindCSS = {
            experimental = {
                classRegex = {
                    { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                    { "cn\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                },
            },
        },
    },
}
