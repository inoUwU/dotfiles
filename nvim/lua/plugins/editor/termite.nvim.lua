return {
  "ruicsh/termite.nvim",
  cmd = { "Termite" },
  keys = {
    { "<A-/>", "<Cmd>Termite toggle<CR>", mode = { "n", "t" }, desc = "Termite toggle" },
    { "<A-t>", "<Cmd>Termite create<CR>", mode = { "n", "t" }, desc = "Termite create" },
    { "<A-n>", "<Cmd>Termite next<CR>", mode = { "t" }, desc = "Termite next" },
    { "<A-p>", "<Cmd>Termite prev<CR>", mode = { "t" }, desc = "Termite prev" },
    { "<A-e>", "<Cmd>Termite editor<CR>", mode = { "t" }, desc = "Termite editor" },
    { "<A-z>", "<Cmd>Termite maximize<CR>", mode = { "t" }, desc = "Termite maximize" },
    { "<A-q>", "<Cmd>Termite close<CR>", mode = { "t" }, desc = "Termite close" },
  },
  opts = {
    position = "bottom",
    height = 0.3,
    width = 1.0,
    wo = { winblend = 10 },
    keymaps = {
      toggle = false,
      create = false,
      next = false,
      prev = false,
      focus_editor = false,
      normal_mode = false,
      maximize = false,
      close = false,
    },
    highlights = {
      border_active = "TermiteBorder", -- Highlight for active terminal border (string = hl group, table = direct definition)
      border_inactive = "TermiteBorderNC", -- Highlight for inactive terminal borders (string = hl group, table = direct definition)
      border_single = "TermiteBorderSingle", -- Highlight for single terminal border (string = hl group, table = direct definition)
      winbar = "TermiteWinbar", -- Highlight for winbar
    },
  },
}
