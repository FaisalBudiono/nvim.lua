local schema_store = require("schemastore")

return {
    autostart = false,
    settings = {
        json = {
            schemas = schema_store.json.schemas(),
            validate = { enable = true },
        },
    },
}
