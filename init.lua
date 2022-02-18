require("plugins")
require("configs")
require("colorschemes")

require("settings")
require("keymappings")

require("lsp")
require("autocommands")

-- Settings specific to this computer.
-- TODO: This can interfere with fresh install of packer.
-- Comment these lines out if PackerInstall etc. are not available after cloning.
require("this_computer")
