return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  -- stylua: ignore
  keys = {
    {"<C-n>",":NvimTreeFocus<CR>",mode = "n",silent = true,desc = "Focus File Explorer"},
    { "<leader>e", ":NvimTreeToggle<CR>", silent = true, desc = "Open File Explorer" },
  },
  cnd = "NvimTreeOpen",
  config = function()
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
}
