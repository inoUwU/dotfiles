return {
  "stevearc/oil.nvim",
  cmd = "Oil",
  keys = {
    { "<leader>e", "<cmd>Oil --float<cr>", desc = "Open Oil file explorer" },
  },
  opts = {
    keymaps = {
      ["q"] = { "actions.close", mode = "n" },
    },
    float = {
      max_width = 0.7,
      max_height = 0.5,
    },
  },
}
