return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
		  local treesitter = require("nvim-treesitter")
		  treesitter.setup({})
		  treesitter.install {
        'c',
        'cpp',
        'java',
        'zig',
        'python',
        'bash',
      }

		  vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
}
