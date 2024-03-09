return {
  -- tablineの拡張する
  "romgrk/barbar.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
    "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  keys = {
    { "<C-j>", ":BufferPrevious<CR>", mode = "n", silent = true, desc = "前のBufferに移動する" },
    { "<C-k>", ":BufferNext<CR>", mode = "n", silent = true, desc = "次のBufferに移動する" },
    { "<C-c>", ":BufferClose<CR>", mode = "n", silent = true, desc = "現在のBufferを閉じる" },
  },
  opts = {
    -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
    animation = true,
    insert_at_start = true,
    -- …etc.
  },
  version = "^1.0.0", -- optional: only update when a new 1.x version is released
}
