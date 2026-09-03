local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  return
end

lualine.setup {
  options = {
    -- theme = "",
    icons_enabled = true,
    component_separators = '|',
    section_separators = { left = '', right = '' },
    globalstatus = true,
  },

  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'filename' },
    lualine_c = { 'branch', 'diff' },
    lualine_x = { 'filetype', 'fileformat' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },

  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  extensions = { 'nvim-tree', 'quickfix' }
}
