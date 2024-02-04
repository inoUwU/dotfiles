return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- windowsではscoopなどでmakeをDlする必要がある
		-- { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				-- telescope内部でのkeymap
				mappings = {
					-- insert mode
					i = {
						["<C-k>"] = actions.move_selections_previous, -- move to prev result
						["<C-j>"] = actions.move_selections_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})
		telescope.
	end,
}
