return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require('lualine').setup({
      options = {
        theme = 'dracula',
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
