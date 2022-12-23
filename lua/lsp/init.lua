local env = require("this_computer")

-- TODO: Move to lua config and change which-key accordingly
vim.cmd("source $HOME/.config/nvim/lua/lsp/coc.vim")

vim.cmd("call coc#config('python.venvPath', '" .. env.python_env_path .. "')")
vim.cmd("call coc#config('python.formatting.blackPath', '" .. env.python_black_path .. "')")
vim.cmd("call coc#config('python.sortImports.path', '" .. env.python_isort_path .. "')")
