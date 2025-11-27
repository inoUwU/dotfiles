return {
  "mvllow/modes.nvim",
  tag = "v0.2.0",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("modes").setup({
      colors = {
        bg = "", -- Optional bg param, defaults to Normal hl group
        copy = "#f5c359",
        delete = "#c75c6a",
        insert = "#78ccc5",
        visual = "#554ede",
      },

      -- Set opacity for cursorline and number background
      line_opacity = 0.2,

      -- Enable cursor highlights
      set_cursor = true,

      -- Enable cursorline initially, and disable cursorline for inactive windows
      -- or ignored filetypes
      set_cursorline = true,

      -- Enable line number highlights to match cursorline
      set_number = true,
    })
  end,
}
