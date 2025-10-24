return {
  "folke/todo-comments.nvim",
  event = {},
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo_comments = require("todo-comments")
    -- set keymaps
    local keymap = vim.keymap
    keymap.set("n", "]t", function()
      todo_comments.jump_next()
    end, { desc = "Jump to next todo comment" })

    keymap.set("n", "[t", function()
      todo_comments.jump_prev()
    end, { desc = "Jump to previous todo comment" })

    todo_comments.setup()
  end,
}
