return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>bf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "n",
      desc = "Format file",
    },
  },
  opts = {
    formatters_by_ft = {
      typescript = { "biome", "prettierd", "prettier" },
      typescriptreact = { "biome", "prettierd", "prettier" },
      javascript = { "biome", "prettierd", "prettier" },
      javascriptreact = { "biome", "prettierd", "prettier" },
      json = { "biome", "prettierd", "prettier" },
      jsonc = { "biome", "prettierd", "prettier" },
      css = { "prettierd", "prettier" },
      scss = { "prettierd", "prettier" },
      less = { "prettierd", "prettier" },
      html = { "prettierd", "prettier" },
      markdown = { "prettierd", "prettier" },
      vue = { "prettierd", "prettier" },
      yaml = { "prettierd", "prettier" },
      yml = { "prettierd", "prettier" },
      lua = { "stylua" },
      python = { "isort", "black" },
      elm = { "elm_format" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
      quiet = false,
    },
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" }, -- shfmt の例: インデントをスペース2つに設定
      },
    },
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
