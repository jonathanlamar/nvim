-- TODO: This breaks when there are unsaved buffers not in windows.
--[[ local utils = require("nvim-tree.utils") ]]
--[[ vim.api.nvim_create_autocmd("BufEnter", { ]]
--[[     nested = true, ]]
--[[     callback = function() ]]
--[[         if #vim.api.nvim_list_wins() == 1 and utils.is_nvim_tree_buf() then ]]
--[[             vim.cmd("quit") ]]
--[[         end ]]
--[[     end, ]]
--[[ }) ]]

-- Don't autocomment new lines
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*", command = "set fo-=c fo-=r fo-=o" })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})

-- Move cursorline to active window
vim.api.nvim_create_autocmd({ "VimEnter", "WinEnter", "BufWinEnter" }, {
    pattern = "*",
    command = "setlocal cursorline",
})
vim.api.nvim_create_autocmd("WinLeave", {
    pattern = "*",
    command = "setlocal nocursorline",
})

local set_terminal_keymaps = function()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end
vim.api.nvim_create_autocmd("TermOpen", { pattern = "term://*", callback = set_terminal_keymaps })

vim.api.nvim_create_augroup("bash", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    group = "bash",
    pattern = "*.sh",
    command = "%s/\\s\\+$//e",
})

vim.api.nvim_create_augroup("java", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = "java",
    pattern = "java",
    callback = function()
        vim.opt["colorcolumn"] = "100"
    end,
})
vim.api.nvim_create_autocmd("BufWritePre", {
    group = "java",
    pattern = "*.java",
    command = "%s/\\s\\+$//e",
})

vim.api.nvim_create_augroup("javascript", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    group = "javascript",
    pattern = "*.js,*.tx",
    command = "%s/\\s\\+$//e",
})
vim.api.nvim_create_autocmd("FileType", {
    group = "javascript",
    pattern = "javascript,typescript",
    callback = function()
        vim.opt["colorcolumn"] = "100"
    end,
})
vim.api.nvim_create_augroup("lua", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    group = "lua",
    pattern = "*.lua",
    command = "%s/\\s\\+$//e",
})

vim.api.nvim_create_augroup("markdown", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    group = "markdown",
    pattern = "*.md",
    command = "%s/\\s\\+$//e",
})
vim.api.nvim_create_autocmd("FileType", {
    group = "markdown",
    pattern = "markdown",
    callback = function()
        vim.opt["colorcolumn"] = "100"
        vim.opt.spell = true
    end,
})
vim.api.nvim_create_augroup("text", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = "text",
    pattern = "text",
    callback = function()
        vim.opt.spell = true
    end,
})

vim.api.nvim_create_augroup("python", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = "python",
    pattern = "*.ipynb",
    callback = function()
        vim.opt["filetype"] = "python"
    end,
})
vim.api.nvim_create_autocmd("BufWritePre", {
    group = "python",
    pattern = "*.py",
    command = "%s/\\s\\+$//e",
})
vim.api.nvim_create_autocmd("FileType", {
    group = "python",
    pattern = "python",
    callback = function()
        vim.opt["colorcolumn"] = "100"
        --[[ vim.opt["foldmethod"] = "indent" ]]
        --[[ vim.opt["foldexpr"] = "" ]]
    end,
})

vim.api.nvim_create_augroup("scala", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = "scala",
    pattern = "*.sbt",
    callback = function()
        vim.opt["filetype"] = "scala"
    end,
})
vim.api.nvim_create_autocmd("BufWritePre", {
    group = "scala",
    pattern = "*.scala,*.sbt",
    command = "%s/\\s\\+$//e",
})
vim.api.nvim_create_autocmd("FileType", {
    group = "scala",
    pattern = "scala",
    callback = function()
        vim.opt["colorcolumn"] = "100"
    end,
})

vim.api.nvim_create_augroup("sql", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    group = "sql",
    pattern = "*.sql",
    command = "%s/\\s\\+$//e",
})

vim.api.nvim_create_augroup("vim", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    group = "vim",
    pattern = "*.vim",
    command = "%s/\\s\\+$//e",
})
