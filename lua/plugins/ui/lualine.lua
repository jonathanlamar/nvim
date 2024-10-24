-- Nice status line
return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
        { "nvim-tree/nvim-web-devicons", lazy = true },
        { "arkav/lualine-lsp-progress", lazy = true },
    },
    config = function()
        -- Condition to hide a section for narrow windows.
        local not_too_wide = function()
            return vim.o.columns > 80
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

        local cfg = require("personal_config")

        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = cfg.lualineTheme,
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                disabled_filetypes = { "alpha", "dashboard", "Outline", "TelescopePrompt" },
                always_divide_middle = true,
                globalstatus = true,
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
                        symbols = { added = " ", modified = " ", removed = " " },
                        cond = not_too_wide,
                    },
                    {
                        "diagnostics",
                        sources = { "nvim_diagnostic" },
                        sections = { "error", "warn", "info", "hint" },
                        symbols = { error = " ", warn = " ", info = " ", hint = " " },
                        update_in_insert = false,
                        cond = not_too_wide,
                    },
                },
                lualine_c = {
                    { "filename", cond = not_too_wide },
                    { "lsp_progress", cond = not_too_wide },
                },
                lualine_x = {
                    {
                        function()
                            return vim.g.remote_neovim_host and ("Remote: %s"):format(vim.uv.os_gethostname()) or ""
                        end,
                        padding = { right = 1, left = 1 },
                        separator = { left = "", right = "" },
                        cond = not_too_wide,
                    },
                    { "encoding", cond = not_too_wide },
                    { "filetype", cond = not_too_wide },
                },
                lualine_y = { progress },
                lualine_z = { { "location", padding = 0 } },
            },
            tabline = {},
            extensions = {},
        })
    end,
}
