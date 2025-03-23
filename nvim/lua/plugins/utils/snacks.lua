return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    indent = { enabled = true },
    animate = { enabled = true },
    bigfile = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    lazygit = { enabled = true },
    terminal = { enabled = true },
    image = { enabled = true },
    scroll = { enabled = true },
    zen = { enabled = true },
    picker = { enabled = true },
  },
  config = function()
    local picker = require("snacks.picker")
    local zen = require("snacks.zen")
    local keymap = vim.keymap -- for conciseness

    local function get_text()
      local visual = picker.util.visual()
      return visual and visual.text or ""
    end

    keymap.set("v", "<leader>ff", function()
      picker.grep({
        on_show = function()
          vim.api.nvim_put({ get_text() }, "c", true, true)
        end,
      })
    end, { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>ff", function()
      picker.files()
    end, { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fs", function()
      picker.grep()
    end, { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fa", function()
      picker.pickers()
    end, { desc = "Find pickers" })
    keymap.set("n", "<leader>fc", function()
      picker.colorschemes()
    end, { desc = "Find colortheme" })
    keymap.set("n", "<leader>wz", function()
      zen.zen()
    end, { desc = "Toggle zen mode" })
  end,
}
