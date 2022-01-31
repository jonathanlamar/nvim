-- Condition to hide a section for narrow windows.
local not_too_wide = function()
  return vim.fn.winwidth(0) > 80
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {'coc-explorer'},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      {
        'branch',
        icon = '',
        cond = not_too_wide,
      },
      {
        'diff',
        symbols = { added = ' ', modified = '柳 ', removed = ' ' },
        cond = not_too_wide,
      },
      {
        'diagnostics',
        sources = { 'coc' },
        symbols = { error = ' ', warn = ' ', info = ' ' },
        cond = not_too_wide,
      },
    },
    lualine_c = {{ 'filename', cond = not_too_wide }},
    lualine_x = {
      { 'encoding', cond = not_too_wide },
      { 'filetype', cond = not_too_wide },
    },
    lualine_y = {'progress'},
    lualine_z = {'location'},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{ 'filename', cond = not_too_wide }},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
