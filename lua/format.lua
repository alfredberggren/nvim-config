vim.api.nvim_create_user_command("Format", function()
	local ft = vim.bo.filetype

	if ft == "c" then
    local win = vim.api.nvim_get_current_win()
    local cursor_pos = vim.api.nvim_win_get_cursor(win)
		vim.cmd("%!clang-format")
    pcall(vim.api.nvim_win_set_cursor, win, cursor_pos)
	else
		vim.notify("No formatter for this file type!")
	end

	vim.keymap.set("n", "<leader>gf", "<CMD>Format<CR>", { buffer = buf, silent = true })
end, {})
