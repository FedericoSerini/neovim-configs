return {
	{
		"projekt0n/github-nvim-theme",
		lazy = false,
		priority = 0,
		config = function()
			vim.cmd([[colorscheme kanagawa-lotus]])
		end,
	},
	{
		"colorscheme github_dark_dimmed",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme kanagawa-lotus]])
		end,
	},
}
