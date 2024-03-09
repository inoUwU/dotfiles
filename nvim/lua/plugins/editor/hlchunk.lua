return {
  "shellRaining/hlchunk.nvim",
  event = { "UIEnter" },
  config = function()
    require("hlchunk").setup({
      indent = {
        -- more code can be found in https://unicodeplus.com/
        chars = { "│", "¦", "┆", "┊" },
        style = {
          "#8B00FF",
        },
      },
      blank = {
        enable = false,
      },
    })
  end,
}
