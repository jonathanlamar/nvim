local M = {}

-- Set up color scheme options
require("colorschemes.material")
require("colorschemes.nightfox")
require("colorschemes.onedark")
require("colorschemes.rose-pine")

M.set_colorscheme = function(colorscheme)
    if colorscheme == "rose" then
        vim.cmd('colorscheme rose-pine')
    elseif colorscheme == "onedark" then
        require("onedark").load()
    elseif colorscheme == "material" then
        vim.g.material_style = 'darker'
        vim.cmd("colorscheme material")
    elseif colorscheme == "nightfox" then
        require("nightfox").load()
    elseif colorscheme == "tokyonight" then
        vim.g.tokyonight_style = "storm"
        vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
        vim.cmd[[colorscheme tokyonight]]
    end
end

M.set_colorscheme("onedark")

return M
