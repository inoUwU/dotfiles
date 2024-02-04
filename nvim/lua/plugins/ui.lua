return {
	-- ターミナル
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup({
				sell = "nu",
				open_mapping = [[<c-\>]],
			})
		end,
	},
	-- ステータスライン
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("config/lualine")
		end,
	},
	-- ファイルエクスプローラー
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			-- TODO add focus command
			{ "<leader>e", ":NvimTreeToggle<CR>", desc = "ファイルエクスプローラーを開く" },
			{ "<leader>e", ":NvimTreeToggle<CR>", desc = "ファイルエクスプローラーを開く" },
		},
		cnd = "NvimTreeOpen",
		config = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
			require("nvim-tree").setup({
				sort = {
					sorter = "case_sensitive",
				},
				renderer = {
					group_empty = true,
				},
				filters = {
					dotfiles = false,
				},
			})
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
	-- ダッシュボード
	{
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	},
	-- フローティングステータスライン
	{
		"b0o/incline.nvim",
		opts = {},
		-- Optional: Lazy load Incline
		event = "VeryLazy",
		config = function()
			require("incline").setup({
				-- thx awesome setting https://github.com/b0o/incline.nvim/discussions/32
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
					local modified = vim.bo[props.buf].modified and "bold,italic" or "bold"

					local function get_git_diff()
						local icons = { removed = "", changed = "", added = "" }
						icons["changed"] = icons.modified
						local signs = vim.b[props.buf].gitsigns_status_dict
						local labels = {}
						if signs == nil then
							return labels
						end
						for name, icon in pairs(icons) do
							if tonumber(signs[name]) and signs[name] > 0 then
								table.insert(labels, { icon .. signs[name] .. " ", group = "Diff" .. name })
							end
						end
						if #labels > 0 then
							table.insert(labels, { "┊ " })
						end
						return labels
					end
					local function get_diagnostic_label()
						local icons = { error = "", warn = "", info = "", hint = "" }
						local label = {}

						for severity, icon in pairs(icons) do
							local n = #vim.diagnostic.get(
								props.buf,
								{ severity = vim.diagnostic.severity[string.upper(severity)] }
							)
							if n > 0 then
								table.insert(label, { icon .. n .. " ", group = "DiagnosticSign" .. severity })
							end
						end
						if #label > 0 then
							table.insert(label, { "┊ " })
						end
						return label
					end

					local buffer = {
						{ get_diagnostic_label() },
						{ get_git_diff() },
						{ (ft_icon or "") .. " ", guifg = ft_color, guibg = "none" },
						{ filename .. " ", gui = modified },
						{ "┊  " .. vim.api.nvim_win_get_number(props.win), group = "DevIconWindows" },
					}
					return buffer
				end,
			})
		end,
	},
	-- messages, cmdline , popupmenu の置き換え
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
