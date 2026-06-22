local function get_cache_filename(filepath)
    return filepath:gsub("/", "") .. ".tags"
end

function cmp_init()
	local ft = vim.bo.filetype

	if ft ~= "c" then
		vim.notify("No complete for this file type!")
		return
	end

	local current_buf_path = vim.api.nvim_buf_get_name(0)

  local script_path = vim.fn.expand("~/.config/nvim/lua/generate_ctags.sh")
  if not vim.loop.fs_stat(script_path) then
    vim.notify("generate_ctags.sh not found", vim.log.levels.ERROR)
    return
  end
	local eval = vim.fn.system(script_path .. " " .. current_buf_path) -- Generate ctags for the file.
  local exit_code = vim.v.shell_error

	if exit_code == 123 then
		vim.notify("tags already exist for this file")
  elseif exit_code ~= 0 then
    vim.notify("Failed to generate ctags")
	end

  local cache_dir = vim.fn.expand("~/.cache/ctags/")
  vim.fn.mkdir(cache_dir, "p")
	vim.o.tags = vim.o.tags .. "," .. cache_dir .. get_cache_filename(current_buf_path)

	vim.api.nvim_create_autocmd("FileType", {
		pattern = "c",
		callback = function()
			vim.bo.omnifunc = "ccomplete#Complete" -- or "syntaxcomplete#Complete"
		end,
	})

	vim.keymap.set("i", "<C-Space>", "<C-x><C-o>", { noremap = true, silent = true })
end

vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*.c",
    callback = cmp_init
})

vim.api.nvim_create_user_command("RefreshCTags", function()
  vim.cmd("w");
	local current_buf_path = vim.api.nvim_buf_get_name(0)
  local script_path = vim.fn.expand("~/.config/nvim/lua/generate_ctags.sh")
	vim.fn.system(script_path .. " " .. current_buf_path .. " refresh") -- Generate ctags for the file.
end, {})
