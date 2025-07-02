return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")

		notify.setup({
			stages = "static",
			max_width = 60,
		})

		vim.notify = notify
	end,
}
