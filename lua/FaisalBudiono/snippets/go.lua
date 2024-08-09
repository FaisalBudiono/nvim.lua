local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

return {
    s(
        "ernil",
        fmt(
            [[
    if {} != nil {{
        return {}
    }}
        ]],
            {
                i(1, "err"),
                f(function(val)
                    return val[1][1]
                end, { 1 }),
            }
        )
    ),
}
