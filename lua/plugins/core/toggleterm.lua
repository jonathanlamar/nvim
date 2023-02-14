-- Terminal popup
return {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    config = function()
        local window_size = function(term)
            if term.direction == "horizontal" then
                return 15
            elseif term.direction == "vertical" then
                return math.floor(vim.o.columns * 0.5)
            end
        end

        require("toggleterm").setup({
            size = window_size,
            -- open_mapping = [[<C-\>]], -- IDKm but this doesn't work for me
            open_mapping = [[<C-t>]],
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = true,
            insert_mappings = true,
            persist_size = true,
            direction = "float",
            close_on_exit = true,
            shell = vim.o.shell,
            float_opts = {
                border = "curved",
                width = math.floor(vim.o.columns * 0.5),
                --height = vim.o.rows*0.5,
                winblend = 15,
                highlights = {
                    border = "Normal",
                    background = "Normal",
                },
            },
        })
    end,
}
