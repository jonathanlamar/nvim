-- Don't autocomment new lines
-- This has to be an autocommand because formatoptions is overwritten or something for each new buffer.
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
    callback = function()
        vim.opt_local.cursorline = true
    end,
})
vim.api.nvim_create_autocmd("WinLeave", {
    pattern = "*",
    callback = function()
        vim.opt_local.cursorline = false
    end,
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

--[[ command = "%s/\\s\\+$//e", ]] -- TODO: Make this a whichkey map

vim.api.nvim_create_augroup("json", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = "json",
    pattern = "json",
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
    end,
})

vim.api.nvim_create_augroup("text", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = "text",
    pattern = "text,markdown",
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.textwidth = 120
        vim.cmd("set fo+=a fo+=t fo+=n")
    end,
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = "text",
    pattern = "*.mdx",
    callback = function()
        vim.opt_local.filetype = "markdown"
    end,
})

vim.api.nvim_create_augroup("python", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = "python",
    pattern = "*.ipynb",
    callback = function()
        vim.opt.filetype = "python"
    end,
})

vim.api.nvim_create_augroup("scala", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = "scala",
    pattern = "*.sbt",
    callback = function()
        vim.opt.filetype = "scala"
    end,
})
vim.api.nvim_create_autocmd("FileType", {
    group = "scala",
    pattern = "scala",
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
    end,
})
