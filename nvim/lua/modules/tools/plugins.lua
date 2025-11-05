local conf = require("modules.tools.config")

return function(tools)
	tools({ "lewis6991/gitsigns.nvim", ft = { "gitcommit", "diff" }, config = conf.git, lazy = true })

	tools({
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup{
				stages = "fade_in_slide_out",
				background_color = "FloatShadow",
				timeout = 1500,
			}
			vim.notify = require("notify")
			vim.keymap.set("n", "<C-x>", function() require("notify").dismiss({ silent = true, pending = true }) end, { desc = "Dismiss all notifications" })
		end
	})
end
