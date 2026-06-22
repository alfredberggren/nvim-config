vim.api.nvim_create_user_command("Cheatsheet", function()
	-- Define path to your cheat sheet markdown file
	local filepath = vim.fn.expand("~/.config/nvim/cheatsheet.md")

	if vim.fn.filereadable(filepath) == 0 then
		vim.notify("Cheatsheet file not found at " .. filepath, vim.log.levels.ERROR)
		return
	end

	-- Target dimensions for the floating window context
	local width = math.floor(vim.o.columns * 0.7)
	local height = math.floor(vim.o.lines * 0.7)
	local col = math.floor((vim.o.columns - width) / 2)
	local row = math.floor((vim.o.lines - height) / 2)

	-- Create an unlisted scratch buffer
	local buf = vim.api.nvim_create_buf(false, true)

	-- Configure floating window parameters
	local opts = {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		style = "minimal",
		border = "rounded",
		title = " Vim/Nvim Cheat Sheet ",
		title_pos = "center",
	}

	-- Open the window and display target buffer
	local win = vim.api.nvim_open_win(buf, true, opts)

	-- Load target file data and assign markdown rendering rules
	vim.cmd("edit " .. filepath)

	-- Set local toggle mappings to quickly dismiss window with 'q' or 'Esc'
	vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = buf, silent = true })
	vim.keymap.set("n", "<Esc>", "<cmd>close<CR>", { buffer = buf, silent = true })
end, {})
