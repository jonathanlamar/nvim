-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
        unstaged = "",
        staged = "S",
        unmerged = "",
        renamed = "➜",
        deleted = "",
        untracked = "U",
        ignored = "◌",
    },
    folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
    },
}

local nvim_tree = require("nvim-tree")
local nvim_tree_config = require("nvim-tree.config")
local tree_cb = nvim_tree_config.nvim_tree_callback

-- These settings are still being migrated to the setup function.
-- For now, they must be called in vimscript
vim.g.nvim_tree_group_empty = 1

nvim_tree.setup({
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = {
        "startify",
        "dashboard",
        "alpha",
    },
    filters = {
        dotfiles = true,
    },
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = true,
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    update_focused_file = {
        enable = false,
        update_cwd = false,
        ignore_list = {},
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 500,
    },
    actions = {
        open_file = {
            resize_window = true,
            quit_on_open = false,
        },
    },
    view = {
        width = 40,
        hide_root_folder = false,
        side = "left",
        mappings = {
            custom_only = false,
            list = {
                { key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
                { key = "h", cb = tree_cb("split") },
                { key = "v", cb = tree_cb("vsplit") },
                { key = "<BS>", cb = tree_cb("dir_up") },
                { key = ".", cb = tree_cb("toggle_dotfiles") },
                -- { key = "<C-t>", cb = vim.cmd("ToggleTerm") }, -- this does not work
                { key = "<C-t>", cb = "" }, -- this does not work
            },
        },
        number = false,
        relativenumber = false,
    },
    renderer = {
        highlight_git = true,
        root_folder_label = ":t",
        icons = {
            show = {
                git = true,
                folder = true,
                file = true,
                folder_arrow = true,
            },
        },
    },
})
