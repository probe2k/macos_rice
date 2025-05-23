local ts_ensure_installed = { "go", "css", "json", "c", "java", "toml", "tsx", "lua", "cpp", "python", "rust", "yaml", "vim", "markdown", "markdown_inline", "vimdoc", "luadoc" }

local treesitter = function()
	local has_ts = pcall(require, 'nvim-treesitter.configs')
	if not has_ts then
		return
	end

	require('nvim-treesitter.configs').setup({
		highlight = {
			enable = true,
			use_languagetree = true,
			disable = { 'elm' },
			custom_captures = { todo = 'TODO' },
		},
	})
end

local treesitter_obj = function()
	require('nvim-treesitter.configs').setup({
		indent = { enable = true },
--		ts_context_commentstring_enabled = true,
		textobjects = {
			lsp_interop = {
				enable = false,
--				peek_definition_code = { ['gd'] = '@function.outer', ['gf'] = '@class.outer' },
			},
			move = {
				enable = true,
				set_jumps = true,
				goto_next_start = {
					[']m'] = '@function.outer',
					[']['] = '@class.outer',
					[']o'] = '@loop.*',
				},
			},
		},

		ensure_installed = ts_ensure_installed,
	})
end

local treesitter_ref = function()
	require('nvim-treesitter.configs').setup({
		refactor = {
			highlight_definitions = { enable = true },
			highlight_current_scope = { enable = true },
			smart_rename = { enable = false },
		},
		matchup = { enable = true },
		autopairs = { enable = true },
		autotag = { enable = true },
	})
end

return {
	treesitter = treesitter,
	treesitter_obj = treesitter_obj,
	treesitter_ref = treesitter_ref,
	installed = ts_ensure_installed,
}
