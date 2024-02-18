local opts = require("FaisalBudiono.util").create_opts

return {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
    },
    keys = {
        { "<c-h>", ":TmuxNavigateLeft<cr>" , opts("TMUX left")},
        { "<c-j>", ":TmuxNavigateDown<cr>" , opts("TMUX down")},
        { "<c-k>", ":TmuxNavigateUp<cr>" , opts("TMUX up")},
        { "<c-l>", ":TmuxNavigateRight<cr>" , opts("TMUX right")},
    },
}
