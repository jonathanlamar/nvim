local utils = require("remote-nvim.utils")
local constants = require("remote-nvim.constants")

return {
    "amitds1997/remote-nvim.nvim",
    version = "*", -- Pin to GitHub releases
    dependencies = {
        "nvim-lua/plenary.nvim", -- For standard functions
        "MunifTanjim/nui.nvim", -- To build the plugin UI
        "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
    },
    config = {
        -- Configuration for devpod connections
        devpod = {
            search_style = "current_dir_only", -- How should devcontainers be searched
            -- For dotfiles, see https://devpod.sh/docs/developing-in-workspaces/dotfiles-in-a-workspace for more information
            dotfiles = {
                path = nil, -- Path to your dotfiles which should be copied into devcontainers
                install_script = nil, -- Install script that should be called to install your dotfiles
            },
            gpg_agent_forwarding = false, -- Should GPG agent be forwarded over the network
            container_list = "running_only", -- How should docker list containers ("running_only" or "all")
        },

        -- Plugin log related configuration [PREFER NOT TO CHANGE THIS]
        log = {
            -- Where is the log file
            filepath = utils.path_join(
                utils.is_windows,
                vim.fn.stdpath("state"),
                ("%s.log"):format(constants.PLUGIN_NAME)
            ),
            -- Level of logging
            level = "info",
            -- At what size, should we truncate the logs
            max_size = 1024 * 1024 * 2, -- 2MB
        },
    },
}
