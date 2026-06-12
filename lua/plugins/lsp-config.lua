return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
    -- 	config = function()
    -- 	require("mason-lspconfig").setup({
    -- 		ensure_installed = { "lua_ls", "pylsp" },
    -- 	})
    -- end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")

      -- LUA LSP CONFIG
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      -- PYLSP CONFIG
      lspconfig.pylsp.setup({
        capabilities = capabilities,
        settings = {
          pylsp = {
            plugins = {
              -- jedi_completion = {fuzzy = true},
              -- jedi_completion = {eager=true},
              jedi_completion = {
                include_params = true,
              },
              jedi_signature_help = { enabled = true },
              jedi = {
                extra_paths = { "~/projects/work_odoo/odoo14", "~/projects/work_odoo/odoo14" },
                -- environment = {"odoo"},
              },
              pyflakes = { enabled = true },
              pylint = {args = {'--ignore=E501,E231', '-'}, enabled=true, debounce=200},
              pylsp_mypy = { enabled = false },
              pycodestyle = {
                enabled = true,
                ignore = { "E501", "E231" },
                maxLineLength = 120,
              },
              yapf = { enabled = true },
            },
          },
        },
      })

      -- RUFF CONFIG (LINTING AND FORMATTING)
      -- lspconfig.ruff.setup({})

      -- HTML
      lspconfig.html.setup({
        capabilities = capabilities,
      })

      -- TS_LS
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })

      -- CLANG
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
