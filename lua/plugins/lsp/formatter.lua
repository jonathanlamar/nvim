return {
    "mhartington/formatter.nvim",
    config = function()
        -- Utilities for creating configurations
        local util = require("formatter.util")

        local env = require("this_computer")
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
                        exe = env.python_env_path .. "/bin/ruff",
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
                        exe = env.python_env_path .. "/bin/ruff",
                        args = {
                            "format",
                            util.get_current_buffer_file_name(),
                        },
                        stdin = false,
                        cwd = util.get_current_buffer_file_dir(),
                    },
                },
                terraform = {
                    require("formatter.filetypes.terraform").terraformfmt,
                },

                -- Use the special "*" filetype for defining formatter configurations on
                -- any filetype
                -- ["*"] = {
                --     require("formatter.filetypes.any").remove_trailing_whitespace,
                -- },
            },
        })
    end,
}
