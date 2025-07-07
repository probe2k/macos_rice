local conf = require('modules.tools.config')

return function(tools)
	tools({
		'plasticboy/vim-markdown',
		ft = 'markdown',
		dependencies = { 'godlygeek/tabular' },
		cmd = { 'Toc' },
		init = conf.markdown,
		lazy = true,
	})

	tools({
		'akinsho/toggleterm.nvim',
		cmd = { 'ToggleTerm', 'TermExec' },
		event = { 'CmdwinEnter', 'CmdlineEnter' },
		config = conf.floaterm,
	})

	tools({
		'lewis6991/gitsigns.nvim',
		ft = { 'gitcommit', 'diff' },
		config = conf.git,
		lazy = true,
	})

	tools({
		'rcarriga/nvim-notify',
		config = function ()
			require('notify').setup {
				stages = 'fade_in_slide_out',
				background_colour = 'FloatShadow',
				timeout = 2000,
			}
			vim.notify = require('notify')
		end
	})
end
