return {
  "nvzone/showkeys",
  dependencies = { "folke/snacks.nvim" },
  opts = {
    timeout = 3,
    maxkeys = 5,
  },
  init = function()
    local showkeys = require("showkeys")
    local snacks = require("snacks")
    snacks
      .toggle({
        name = "Showkeys",
        get = function()
          return require("showkeys.state").visible
        end,
        set = function()
          showkeys.toggle()
        end,
      })
      :map("<leader>wk")
  end,
}
