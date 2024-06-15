return {
  -- 色コードの背景に色を付ける
  "NvChad/nvim-colorizer.lua",
  event = { "BufReadPre", "BufNewFile" },
  -- config = true,
  opts = {
    user_default_options = {
      mode = "background",
    },
  },
}
