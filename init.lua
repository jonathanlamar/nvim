local is_bootstrap = require("plugins")
if is_bootstrap then
    return
end

require("configs")
require("colorschemes")

require("settings")
require("keymappings")

require("lsp")
require("autocommands")

-- Settings specific to this computer.
require("this_computer")
