return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
      "bash",
      "c",
      "diff",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "printf",
      "python",
      "query",
      "regex",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
      },
    },
    config = function()
		  local treesitter = require("nvim-treesitter")
		  treesitter.setup({})

		  vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
}
