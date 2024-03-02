return {
  "nvimdev/lspsaga.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
  config = function()
    require("lspsaga").setup({})

    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "Kh", "<cmd>Lspsaga hover_doc<cr>", { desc = "Open Hover Doc" })
    keymap.set("n", "Ka", "<cmd>Lspsaga code_action<cr>", { desc = "Code Action" })
  end,
}
