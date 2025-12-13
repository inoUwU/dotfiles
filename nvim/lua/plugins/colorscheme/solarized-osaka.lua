return {
  "craftzdog/solarized-osaka.nvim",
  lazy = true,
  config = function()
    require("solarized-osaka").setup({
      transparent = true,
      styles = {
        floats = "transparent",
        sidebars = "transparent",
      },
      on_highlights = function(hl, c)
        -- local prompt = "#2d3149"
        hl.TelescopeNormal = {
          bg = c.bg_dark,
          fg = c.fg_dark,
        }
        hl.TelescopeBorder = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.telescopepromptnormal = {
          bg = prompt,
        }
        hl.telescopepromptborder = {
          bg = prompt,
          fg = prompt,
        }
        hl.telescopeprompttitle = {
          bg = prompt,
          fg = prompt,
        }
        hl.TelescopePreviewTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopeResultsTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
      end,
    })
  end,
}
