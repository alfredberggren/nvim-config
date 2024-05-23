return {
	"numToStr/Comment.nvim",
	opts = {
		-- add any options here
	},
	lazy = false,
	config = function()
		require("Comment").setup({
			opleader = {
				line = "<leader>/",
			},
			toggler = {
				line = "<leader>/",
			},
		})
	end,
}
