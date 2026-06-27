return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	build = "make",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
		"zbirenbaum/copilot.lua", -- optional
	},

	opts = {
		provider = "openai",
		providers = {
			openai = {
				endpoint = "http://172.21.144.1:1234/v1",
				-- model = "qwen2.5-coder-7b-instruct",
				model = "qwen/qwen3.5-9b",
				timeout = 100000,

				api_key_name = "LM_STUDIO_API_KEY",
				extra_request_body = {
					temperature = 0.1,
					max_completion_tokens = 8192,
				},
			},
		},
		windows = {
			width = 60,
		},
	},
}
