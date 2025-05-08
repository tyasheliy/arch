return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")

		notify.setup({
			stages = "static",
			top_down = false,
			max_width = 60,
		})

		vim.notify = notify
	end,
}
