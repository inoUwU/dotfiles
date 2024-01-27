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
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	-- 通知
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#000000",
			})
		end,
	},
}
