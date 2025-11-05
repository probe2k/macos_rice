local config = {}

math.randomseed(os.time())

function config.noice()
	require("noice").setup({
		cmdline = {
			enabled = true,
			view = "cmdline_popup",
			format = {
				cmdline = { pattern = "^:", icon = "💻 ", lang = "vim" },
				search_down = { kind = "search", pattern = "^/", icon = "🔍 ", lang = "regex" },
				search_up = { kind = "search", pattern = "^/", icon = "🔍 ", lang = "regex" },
				filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
				lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "💀 ", lang = "lua" },
				help = { pattern = "^:%s*he?l?p?%s+", icon = "❓ " },
				input = { view = "cmdline_input", icon = "🖊️  " },
			}
		},

		messages = { enabled = true },

		popupmenu = { enabled = true },

		lsp = {
			progress = { enabled = true },
			hover = { enabled = false },
			signature = { enabled = true },
		}
	})
end

function config.starry()
	require("transparent").setup({
		groups = {
			"Normal", "NormalNC", "Comment", "Constant", "Special", "Identifier",
			"Statement", "PreProc", "Type", "Underlined", "Todo", "String", "Function",
			"Conditional", "Repeat", "Operator", "Structure", "LineNr", "NonText",
			"SignColumn", "CursorLine", "CursorLineNr", "StatusLine", "StatusLineNC",
			"EndOfBuffer", "FloatBorder",
		},
		extra_groups = {
			"NormalFloat", "TelescopeNormal", "TelescopePromptBorder", "TelescopePreviewBorder", "TelescopeResultsBorder", "NvimTreeNormal"
		},
		exclude_groups = {},
		on_clear = function() end,
	})

	require("starry").setup({
		border = false,
		italics = {
			comments = true,
			keywords = false,
			functions = true,
			variables = false,
			strings = false,
		},
		contrast = { enable = true, terminal = true },
		disable = { background = true, term_colors = false },
		style = { name = "earlysummer" },
	})

	vim.cmd([[ TransparentEnable ]])
	vim.cmd([[ colorscheme moonlight ]])
end

return config
