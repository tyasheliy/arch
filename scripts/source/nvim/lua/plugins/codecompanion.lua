return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"hrsh7th/nvim-cmp",
	},
	opts = {
		opts = {
			log_level = "DEBUG",
		},
		strategies = {
			chat = {
				adapter = "ollama_aiserver",
			},
			inline = {
				adapter = "ollama_aiserver",
			},
			agent = {
				adapter = "ollama_aiserver",
			},
		},
		adapters = {
			http = {
				ollama_aiserver = function()
					return require("codecompanion.adapters").extend("ollama", {
						name = "ollama_aiserver",
						env = {
							url = "http://aiserver:11434",
						},
						opts = {
							vision = true,
							stream = true,
						},
						schema = {
							model = {
								default = "qwen3:8b",
							},
							think = {
								default = false,
							},
							keep_alive = {
								default = "5m",
							},
						},
					})
				end,
			},
		},
	},
}
