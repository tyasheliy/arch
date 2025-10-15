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
				adapter = "ai_mediator",
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
				ai_mediator = function()
					return require("codecompanion.adapters").extend("openai", {
						name="ai_mediator",
						env = {
							api_key = vim.env.AIMEDIATOR_API_KEY,
						},
						url = "https://api.ai-mediator.ru/v1/chat/completions",
						schema = {
							model = {
								default = "openai/gpt-oss-120b",
							},
							max_tokens = {
								default = 8192,
							},
							temperature = {
								default = 1,
							},
						},
					})
				end,
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
