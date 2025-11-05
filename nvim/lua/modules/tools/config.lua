local config = {}

function config.git()
	require("gitsigns").setup({
		signs = {
			add          = { text = "┃" },
			change       = { text = "┃" },
			delete       = { text = "_" },
			topdelete    = { text = "‾" },
			changedelete = { text = "~" },
			untracked    = { text = "┆" },
		},
		signs_staged = {
			add          = { text = "┃" },
			change       = { text = "┃" },
			delete       = { text = "_" },
			topdelete    = { text = "‾" },
			changedelete = { text = "~" },
			untracked    = { text = "┆" },
		},
		signs_staged_enable = true,
		signcolumn = true,
		linehl = true,
		numhl = true,
		watch_gitdir = { interval = 1000, follow_files = true },
		update_debounce = 400,
		word_diff = true,
		status_formatter = nil,
		debug_mode = false,
		current_line_blame = true,
		current_line_blame_opts = { delay = 1500 },
		diff_opts = { internal = true },
		current_line_blame_formatter = " <author>, <author_time:%R> - <summary>",
		preview_config = { style = "minimal", relative = "cursor", row = 0, column = 1 },
	})

	vim.api.nvim_set_hl(0, "GitSignsAddLn", { bg = "#203d27", blend = 10 })
	vim.api.nvim_set_hl(0, "GitSignsChangeLn", { bg = "#1d3452", blend = 10 })
	vim.api.nvim_set_hl(0, "GitSignsDeleteLn", { bg = "#4b1e1e", blend = 10 })
end

return config
