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

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.pylsp.setup({
				capabilities = capabilities,
        -- if pylint is enabled this way it doesnt understand venv
				-- settings = {
				-- 	pylsp = {
				-- 		plugins = {
				-- 			pylint = {
				-- 				enabled = true,
				-- 			},
				-- 		},
				-- 	},
				-- },
			})
			-- lspconfig.basedpyright.setup({
			-- 	capabilities = capabilities,
			-- })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
