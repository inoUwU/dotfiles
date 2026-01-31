return {
  "masisz/wisteria.nvim",
  name = "wisteria",
  lazy = true,
  opts = {
    transparent = true,
    ---@type fun(colors:WisteriaColors):HighlightSpec
    overrides = function(colors)
      return {}
    end,
  },
}
