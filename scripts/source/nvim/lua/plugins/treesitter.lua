return {
	"nvim-treesitter/nvim-treesitter",
	build = "TSUpdate",
	lazy = false,
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"javascript",
				"html",
				"php",
				"go",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
