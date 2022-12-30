local null_ls = require("null-ls")
local env = require("this_computer")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        -- eslint with opinionated defaults
        --[[ null_ls.builtins.code_actions.xo, ]]
        null_ls.builtins.formatting.prettier,
        --[[ null_ls.builtins.code_actions.refactoring, ]]
        null_ls.builtins.diagnostics.flake8.with({
            command = env.python_env_path .. "/bin/flake8"
        }),
        -- Static type checker.  May be redundant with flake8
        --[[ null_ls.builtins.diagnostics.pydocstyle.with({ ]]
        --[[     command = env.python_pydocstyle_path, ]]
        --[[ }), ]]
        null_ls.builtins.formatting.isort.with({
            command = env.python_env_path .. "/bin/isort",
        }),
        null_ls.builtins.formatting.black.with({
            command = env.python_env_path .. "/bin/black",
        }),
    },
})
