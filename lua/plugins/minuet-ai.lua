return {
	"milanglacier/minuet-ai.nvim",
	config = function()
		require("minuet").setup({
			provider = "openai_fim_compatible",
			provider_options = {
				openai_fim_compatible = {
					api_key = "TERM",
					end_point = "http://172.21.144.1:1234/v1/completions",
					model = "qwen2.5-coder-1.5b-instruct",
				},
			},
			n_completions = 1,
			context_window = 512,
			inline_completion = {
				enable = true,
			},
			virtualtext = {
				-- auto_trigger_ft = { "*" },
				keymap = {
					-- accept whole completion
					-- accept = "<C-Up>",
					-- accept one line
					accept_line = "<C-Up>",
					-- accept n lines (prompts for number)
					-- e.g. "A-z 2 CR" will accept 2 lines
					accept_n_lines = "<A-z>",
					-- Cycle to prev completion item, or manually invoke completion
					prev = "<C-Left>",
					-- Cycle to next completion item, or manually invoke completion
					next = "<C-Right>",
					dismiss = "<C-Down>",
				},
			},
		})
	end,
}
