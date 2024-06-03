return {
    filetypes = {
        "css",
        "less",
        "sass",
        "scss",
        "javascript",
        "javascriptreact",
        "rescript",
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
