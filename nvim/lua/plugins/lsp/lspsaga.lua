return {
  "nvimdev/lspsaga.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lspsaga").setup({})
    local keymap = vim.keymap
    keymap.set("n", "<leader>lo", "<cmd>Lspsaga outline<cr>", { desc = "OutLine" })
    keymap.set("n", "<leader>lf", "<cmd>Lspsaga finder<cr>", { desc = "Finder" })
    keymap.set("n", "<leader>lp", "<cmd>Lspsaga peek_definition<cr>", { desc = "Peek definition" })
    keymap.set("n", "<leader>la", "<cmd>Lspsaga code_action<cr>", { desc = "Code action" })
    keymap.set("n", "<leader>lsb", "<cmd>Lspsaga show_buf_diagnostics<cr>", { desc = "Show buf diagnostics" })
    keymap.set(
      "n",
      "<leader>lsw",
      "<cmd>Lspsaga show_workspace_diagnostics ++float<cr>",
      { desc = "Show workspace diagnostics" }
    )
    keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", { noremap = true, desc = "Hover doc" })
  end,
}
