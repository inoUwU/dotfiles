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
}
