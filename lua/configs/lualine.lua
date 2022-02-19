-- Condition to hide a section for narrow windows.
local not_too_wide = function()
    return vim.fn.winwidth(0) > 80
end

-- cool function for progress
local progress = function()
    local current_line = vim.fn.line(".")
    local total_lines = vim.fn.line("$")
    local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
end

local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "dashboard", "coc-explorer", "Outline" },
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = {
            {
                "branch",
                icon = "",
                cond = not_too_wide,
            },
            {
                "diff",
                symbols = { added = " ", modified = "柳 ", removed = " " },
                cond = not_too_wide,
            },
            {
                "diagnostics",
                sources = { "coc" },
                sections = { "error", "warn" },
                symbols = { error = " ", warn = " " },
                update_in_insert = false,
                cond = not_too_wide,
            },
        },
        lualine_c = { { "filename", cond = not_too_wide } },
        lualine_x = {
            { "encoding", cond = not_too_wide },
            { "filetype", cond = not_too_wide },
        },
        lualine_y = { progress },
        lualine_z = { { "location", padding = 0 } },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename", cond = not_too_wide } },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {},
})
