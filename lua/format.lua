vim.api.nvim_create_user_command("Format", function()
	local ft = vim.bo.filetype

	if ft == "c" then
		vim.cmd("%!clang-format")
	else
		vim.notify("No formatter for this file type!")
	end

	vim.keymap.set("n", "<leader>gf", "<CMD>Format<CR>", { buffer = buf, silent = true })
end, {})
