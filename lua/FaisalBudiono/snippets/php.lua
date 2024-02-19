local ls = require("luasnip")
local s = ls.snippet
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

local util = require("FaisalBudiono.util")

return {
    s(
        "cphp",
        fmt(
            [[
<?php

declare(strict_types=1);

namespace {};

class {}
{{
}}
            ]],
            {
                f(util.relative_path),
                f(util.file_name),
            }
        )
    ),

    s(
        "ctry",
        fmt(
            [[
    try {{
    }}catch(\Exception $e){{
    }}
            ]],
            {}
        )
    ),

    s(
        "cctry",
        fmt(
            [[
    try {{
        $this->fail('Should throw error');
    }} catch (AssertionFailedError $e) {{
        throw $e;
    }}catch(\Exception $e){{
    }}
            ]],
            {}
        )
    ),
}
