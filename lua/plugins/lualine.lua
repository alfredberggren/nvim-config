return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require('lualine').setup({
      options = {
        -- theme = 'base16',
        component_separators = '|',
        section_separators = ' ',
      },
      sections = {
        lualine_c = {
          'buffers'
        }
      }
    })
  end
}
