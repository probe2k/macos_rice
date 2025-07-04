local conf = require('modules.ui.config')

return function(ui)
	ui({ 'nvim-tree/nvim-web-devicons', lazy = true })

--	ui({
--		'windwp/windline.nvim',
--		config = conf.windline,
--		lazy = true,
--	})

	ui({
		'nvim-lualine/lualine.nvim',
		lazy = true,
	})

	ui({
		'folke/noice.nvim',
		lazy = true,
		dependencies = { 'MunifTanjim/nui.nvim', lazy = true },
		config = conf.noice,
	})

	ui({
		'akinsho/bufferline.nvim',
		config = conf.nvim_bufferline,
		lazy = true,
	})

	ui({
		'nvim-tree/nvim-tree.lua',
		cmd = { 'NvimTreeToggle', 'NvimTreeOpen' },
		init = conf.nvim_tree_setup,
		config = conf.nvim_tree,
	})

	ui({
		'lukas-reineke/indent-blankline.nvim',
		lazy = true,
		version = "2.20.8",
		config = conf.blankline,
	})

--	ui({
--		'catppuccin/nvim',
--		lazy = true,
--		name = 'catppuccin',
--		config = conf.cat,
--	})

--	ui({
--		"craftzdog/solarized-osaka.nvim",
--		lazy = true,
--		name = 'solarized-osaka',
--		config = conf.osaka,
--	})

	ui({
		'nyoom-engineering/oxocarbon.nvim',
		lazy = true,
		name = 'oxocarbon',
		config = conf.oxo,
	})

--	ui({
--		'ray-x/starry.nvim',
--		lazy = true,
--		name = 'starry',
--		config = conf.starry,
--	})
end
