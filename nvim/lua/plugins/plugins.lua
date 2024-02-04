return {
	{
		"williamboman/mason.nvim",
		opts = {},
		build = ":MasonUpdate",
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = nil,
		config = function()
			require("mason-lspconfig").setup({})
		end,

		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "neovim/nvim-lspconfig" },
			{ "echasnovski/mini.completion", version = false },
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = nil,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	-- コメントアウト切り替え
	{
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
	},
}
