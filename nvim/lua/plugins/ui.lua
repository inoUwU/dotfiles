return {
	{
		"voldikss/vim-floaterm",
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("config/lualine")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("config/nvim-tree")
		end,
	},
	-- スクロールバー
	{
		"petertriho/nvim-scrollbar",
		config = function()
			require("scrollbar").setup()
		end,
	},
	-- インデント色付け
	{
		"shellRaining/hlchunk.nvim",
		event = { "UIEnter" },
		config = function()
			require("config/hlchunk")
		end,
	},
}
