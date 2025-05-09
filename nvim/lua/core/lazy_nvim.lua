local uv, api, fn = vim.loop, vim.api, vim.fn
local helper = require('core.helper')
local lazy = {}
lazy.__index = lazy

local sep = require('core.global').path_sep

function lazy.add(repo)
	if not lazy.plug then
		lazy.plug = {}
	end
	if repo.lazy == nil then
		repo.lazy = true
	end
	table.insert(lazy.plug, repo)
end

function lazy:load_modules_lazyages()
	local modules_dir = helper.get_config_path() .. sep .. 'lua' .. sep .. 'modules'
	self.repos = {}

	local list = vim.fs.find('plugins.lua', { path = modules_dir, type = 'file', limit = 10 })
	if #list == 0 then
		return
	end

	local disable_modules = {}

	if fn.exists('g:disable_modules') == 1 then
		disable_modules = vim.split(vim.g.disable_modules, ',')
	end

	for _, f in pairs(list) do
		local _, pos = f:find(modules_dir)
		f = f:sub(pos - 6, #f - 4)
		if not vim.tbl_contains(disable_modules, f) then
			local plugins = require(f)
			plugins(lazy.add)
		end
	end
end

function lazy:boot_strap()
	local lazy_path = string.format('%s%slazy%slazy.nvim', helper.get_data_path(), sep, sep)
	local state = uv.fs_stat(lazy_path)
	if not state then
		local cmd = '!git clone https://github.com/folke/lazy.nvim ' .. lazy_path
		vim.cmd(cmd)
	end
	vim.opt.runtimepath:prepend(lazy_path)
	local lz = require('lazy')
	local opts = {
		lockfile = helper.get_data_path() .. sep .. 'lazy-lock.json',
		dev = { path = '~/github/probe2k' },
		ui = {
			border = "single",
			size = {
				width = 0.8,
				height = 0.8,
			},
			icons = {
				cmd = "💻 ",
				config = "⚙️  ",
				event = "🎭 ",
				favorite = "❤️  ",
				ft = "📝 ",
				init = "🏁 ",
				import = "📦 ",
				keys = "🔑 ",
				lazy = "💤 ",
				loaded = "⚪️ ",
				not_loaded = "🔘 ",
				plugin = "🔌 ",
				runtime = "👾 ",
				require = "🚨 ",
				source = "ℹ️  ",
				start = "🔰 ",
				task = "☑️  ",
				list = { "🔴 ", "➡️  ", "✨ ", "🗑️ " },
			}
		},
	}
	self:load_modules_lazyages()
	lz.setup(self.plug, opts)
end

return lazy
