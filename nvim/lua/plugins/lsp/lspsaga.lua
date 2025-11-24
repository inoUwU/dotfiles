return {
  "nvimdev/lspsaga.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lspsaga").setup({})
    local keymap = vim.keymap
    keymap.set("n", "<leader>lo", "<cmd>Lspsaga outline<cr>", { desc = "OutLine" })
    keymap.set("n", "<leader>lf", "<cmd>Lspsaga finder<cr>", { desc = "Finder" })
    keymap.set("n", "<leader>lp", "<cmd>Lspsaga peek_definition<cr>", { desc = "Peek definition" })
    keymap.set("n", "<leader>lsb", "<cmd>Lspsaga show_buf_diagnostics<cr>", { desc = "Show buf diagnostics" })
    keymap.set("n", "<leader>li", "<cmd>Lspsaga hover_doc<cr>", { desc = "Hover doc" })
    keymap.set(
      "n",
      "<leader>lsw",
      "<cmd>Lspsaga show_workspace_diagnostics ++float<cr>",
      { desc = "Show workspace diagnostics" }
    )
  end,

  -- TODO: リストラ
  -- vim.keymap.set('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<Cr>', { desc = 'Hover' })
  -- vim.keymap.set('n', '<Leader>lf', '<Cmd>lua vim.lsp.buf.format()<Cr>', { desc = 'format code' })
  -- vim.keymap.set('n', '<Leader>lr', Snacks.picker.lsp_references, { desc = 'references' })
  -- vim.keymap.set('n', '<Leader>ld', Snacks.picker.lsp_definitions, { desc = 'go to definition' })
  -- vim.keymap.set('n', '<Leader>lD', Snacks.picker.lsp_declarations, { desc = 'go to declaration' })
  -- vim.keymap.set('n', '<Leader>li', Snacks.picker.lsp_implementations, { desc = 'go to implementation' })
  -- vim.keymap.set('n', '<Leader>lt', Snacks.picker.lsp_type_definitions, { desc = 'go to type definition' })
  -- vim.keymap.set('n', '<Leader>ln', '<Cmd>lua vim.lsp.buf.rename()<Cr>', { desc = 'rename symbol' })
  -- vim.keymap.set('n', '<Leader>lc', '<Cmd>lua vim.lsp.buf.code_action()<Cr>', { desc = 'code action' })
  -- vim.keymap.set('n', '<Leader>lI', '<Cmd>lua vim.lsp.buf.incoming_calls()<Cr>', { desc = 'incoming calls' })
  -- vim.keymap.set('n', '<Leader>lo', '<Cmd>lua vim.lsp.buf.outgoing_calls()<Cr>', { desc = 'outgoing calls' })
  -- vim.keymap.set('n', '<Leader>le', '<Cmd>lua vim.diagnostic.open_float()<Cr>', { desc = 'open diagnostics' })
  -- vim.keymap.set('n', ']l', '<Cmd>lua vim.diagnostic.goto_next()<Cr>', { desc = 'go to next diagnostics' })
  -- vim.keymap.set('n', '[l', '<Cmd>lua vim.diagnostic.goto_prev()<Cr>', { desc = 'go to previous diagnostics' })
  --
}
