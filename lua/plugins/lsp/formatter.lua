return {
    "mhartington/formatter.nvim",
    config = function()
        -- Utilities for creating configurations
        local util = require("formatter.util")
        -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
        require("formatter").setup({
            -- Enable or disable logging
            logging = true,
            -- Set the log level
            log_level = vim.log.levels.WARN,
            -- All formatter configurations are opt-in
            filetype = {
                lua = {
                    require("formatter.filetypes.lua").stylua,
                },
                python = {
                    {
                        exe = vim.g.PersonalConfig.python_path .. "/bin/ruff",
                        args = {
                            "check",
                            util.get_current_buffer_file_name(),
                            "--select I",
                            "--fix",
                        },
                        stdin = false,
                        cwd = util.get_current_buffer_file_dir(),
                    },
                    {
                        exe = vim.g.PersonalConfig.python_path .. "/bin/ruff",
                        args = {
                            "format",
                            util.get_current_buffer_file_name(),
                        },
                        stdin = false,
                        cwd = util.get_current_buffer_file_dir(),
                    },
                },
            },
        })
    end,
}
