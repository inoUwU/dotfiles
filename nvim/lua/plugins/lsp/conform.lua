-- lua/plugins/conform.lua
return {
  "stevearc/conform.nvim",
  -- `BufWritePre` イベントでロードされるように設定
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    -- Leaderキー + b + f で現在のバッファをフォーマット
    {
      "<leader>bf",
      function()
        -- 非同期でフォーマットを実行し、LSPフォーマッターへのフォールバックを許可
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "n",
      desc = "Format file",
    },
  },
  opts = {
    -- ファイルタイプごとのフォーマッター定義
    formatters_by_ft = {
      -- TypeScript/JavaScript/JSX/JSON ファイルには Biome を優先し、Prettier をフォールバックとして使用
      -- Biome は設定ファイル (biome.json) を自動的に探し、それに基づいて動作します
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
      markdown = { "prettierd", "prettier" }, -- markdown も prettier でフォーマット
      vue = { "prettierd", "prettier" }, -- vue も prettier でフォーマット
      yaml = { "prettierd", "prettier" },
      yml = { "prettierd", "prettier" },
      lua = { "stylua" }, -- Lua ファイル用のフォーマッター
      -- Python ファイルには isort (importの並べ替え) を優先し、black (コードフォーマット) を使用
      python = { "isort", "black" },
      elm = { "elm_format" },
    },
    -- ファイル保存時に自動フォーマットを有効にする
    format_on_save = {
      timeout_ms = 500, -- フォーマットのタイムアウト時間 (ミリ秒)
      lsp_fallback = true, -- LSP フォーマッターへのフォールバックを許可
      quiet = true, -- フォーマット時に通知を表示しない
    },
    -- 個別のフォーマッターのカスタマイズ (必要であれば)
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" }, -- shfmt の例: インデントをスペース2つに設定
      },
    },
  },
  init = function()
    -- `formatexpr` オプションを設定し、ビジュアルモードでの範囲フォーマットを可能にする
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
