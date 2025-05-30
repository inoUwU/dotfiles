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
    toggle = { enabled = true },
    zen = {
      enabled = true,
      toggles = {
        ufo = true,
        dim = true,
        git_signs = true,
        diagnostics = true,
        line_number = true,
        relative_number = true,
      },
    },
    picker = { enabled = true },
    dashboard = { example = "doom" },
  },
  config = function()
    local picker = require("snacks.picker")

    -- TODO　色は変わらなくていい
    local snacks = require("snacks")
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

    keymap.set("n", "<leader>fb", function()
      picker.buffers()
    end, { desc = "Find buffers" })

    keymap.set("n", "<C-p>", function()
      picker.commands()
    end, { desc = "Show commands" })

    snacks.toggle.diagnostics():map("<leader>wd")
    snacks.toggle.zen():map("<leader>wz")
    snacks.toggle.inlay_hints():map("<leader>wi")

    keymap.set("n", "<leader>wl", function()
      snacks.lazygit.open()
    end, { desc = "Open lazygit" })
  end,
}
