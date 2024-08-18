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

    s(
        "cbug",
        fmt(
            [[
    fmt.Printf("Kambing {} %#v\n",{})
            ]],
            {
                i(1, "Whatttt"),
                i(2),
            }
        )
    ),

    s(
        "cgof",
        fmt(
            [[
    go func() {{
        {}
    }}()
            ]],
            {
                i(1),
            }
        )
    ),
}
