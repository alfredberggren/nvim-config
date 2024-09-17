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
							jedi_completion = {
								-- include_class_objects = true,
								-- include_function_objects = true,
                fuzzy = true,
							},
							autopep8 = {
								enabled = false,
							},
							mccabe = {
								enabled = false,
							},
							pycodestyle = {
								enabled = false,
							},
							pyflakes = {
								enabled = false,
							},
							yapf = {
								enabled = false,
							},
						},
					},
				},
			})

			-- RUFF CONFIG (LINTING AND FORMATTING)
			lspconfig.ruff_lsp.setup({
				capabilities = capabilities,
			})

      -- HTML
      lspconfig.html.setup({
        capabilities = capabilities,
      })

      -- TS_LS
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
