local conf = require("modules.ui.config")

return function(ui)
	ui({ "folke/noice.nvim", lazy = true, dependencies = { "MunifTanjim/nui.nvim", lazy = true }, config = conf.noice })

	ui({ "xiyaowong/transparent.nvim", cmd = { "TransparentEnable", "TransparentDisable", "TransparentToggle" }, lazy = true, name = "transparent" })

	ui({ "ray-x/starry.nvim", lazy = true, name = "starry", config = conf.starry })
end

