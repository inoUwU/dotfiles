return {
  "nvimdev/lspsaga.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
  config = function()
    require("lspsaga").setup({
      show_file = false,
    })
    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "<leader>lo", "<cmd>Lspsaga outline<cr>", { desc = "OutLine" })
    keymap.set("n", "<leader>lf", "<cmd>Lspsaga finder<cr>", { desc = "Finder" })
    keymap.set("n", "<leader>lp", "<cmd>Lspsaga peek_definition<cr>", { desc = "Peek definition" })
    keymap.set("n", "<leader>la", "<cmd>Lspsaga code_action<cr>", { desc = "Code action" })
    keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", { noremap = true, desc = "Hover doc" })
  end,
}
