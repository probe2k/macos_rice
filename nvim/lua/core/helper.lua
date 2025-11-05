_G = _G or {}

fn = vim.fn

local global = require("core.global")

local helper = {
	init = function()
		_G.compare_to_clipboard = function()
			local ftype = vim.api.nvim_eval("&filetype")
			vim.cmd(string.format(
				[[
				vsplit
				enew
				normal! P
				setlocal buftype=nowrite
				set filetype=%s
				diffthis
				bprevious
				execute "normal! \<C-w>\<C-w>"
				diffthis
				]],
				ftype
			))
		end
	end,

	path_sep = global.path_sep,

	get_config_path = function()
		return fn.stdpath("config")
	end,

	get_data_path = function()
		return global.data_dir
	end,
}

return helper
