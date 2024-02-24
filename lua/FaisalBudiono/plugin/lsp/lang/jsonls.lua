local schema_store = require("schemastore")

return {
    settings = {
        json = {
            schemas = schema_store.json.schemas({
                replace = {
                    ["composer.json"] = {
                        description = "Custom composer.json",
                        fileMatch = { "composer.json" },
                        name = "composer.json",
                        url = "https://gist.githubusercontent.com/FaisalBudiono/3392f25dda51dc837d607e21d8be1a59/raw/de381b147ae491d82418854027b7635b9ac1b508/composer-schema.json",
                    },
                },
            }),
            validate = { enable = true },
        },
    },
}
