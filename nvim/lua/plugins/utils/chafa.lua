return {
  "inoUwU/chafa.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "m00qek/baleia.nvim",
  },
  config = function()
    require("chafa").setup({
      require("chafa").setup({
        render = {
          min_padding = 5,
          show_label = true,
        },
        events = {
          update_on_nvim_resize = true,
        },
      }),
    })
  end,
}

-- return {
--   dir = "~/github/chafa.nvim/",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     "m00qek/baleia.nvim",
--   },
--   config = function()
--     require("chafa").setup({
--       require("chafa").setup({
--         render = {
--           min_padding = 5,
--           show_label = true,
--         },
--         events = {
--           update_on_nvim_resize = true,
--         },
--       }),
--     })
--   end,
-- }
