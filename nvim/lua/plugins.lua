return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('config/lualine')
    end
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('config/nvim-tree')
    end
  },
  -- カラーテーマ
  {
   "craftzdog/solarized-osaka.nvim",
   lazy = false,
   priority = 1000,
   opts = {},
  }
}
