function cmp_init()
	local ft = vim.bo.filetype

	if ft ~= "c" then
		vim.notify("No complete for this file type!")
		return
	end

	local current_buf_path = vim.api.nvim_buf_get_name(0)

	local eval = os.execute("~/.config/nvim/lua/generate_ctags.sh " .. current_buf_path) -- Generate ctags for the file.

	if eval ~= true then
		vim.notify("tags already exist for this file. not generating.")
	end

	vim.o.tags = vim.o.tags .. ",/home/alfredberggren/.cache/ctags/homealfredberggrencc_projectsleap_yearleap.c.tags"

	vim.api.nvim_create_autocmd("FileType", {
		pattern = "c",
		callback = function()
			vim.bo.omnifunc = "ccomplete#Complete" -- or "syntaxcomplete#Complete"
		end,
	})

	vim.keymap.set("i", "<C-Space>", "<C-x><C-o>", { noremap = true, silent = true })
end

vim.cmd("autocmd BufReadPost * lua cmp_init()")
-- Todo: create refresh cmd
vim.api.nvim_create_user_command("RefreshCTags", function()
	local current_buf_path = vim.api.nvim_buf_get_name(0)
	vim.cmd("!~/.config/nvim/lua/generate_ctags.sh " .. current_buf_path .. " refresh") -- Generate ctags for the file.
end, {})
