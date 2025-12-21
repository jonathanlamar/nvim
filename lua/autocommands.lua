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

vim.api.nvim_create_augroup("python", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = "python",
    pattern = "*.ipynb",
    callback = function()
        vim.opt.filetype = "python"
    end,
})

vim.api.nvim_create_augroup("__formatter__", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
    group = "__formatter__",
    command = ":FormatWrite",
})

vim.api.nvim_create_augroup("nvim-tree", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    group = "nvim-tree",
    callback = function()
        if vim.bo.filetype == "NvimTree" and vim.fn.winnr("$") == 1 then
            vim.cmd(":q!")
        end
    end,
})
