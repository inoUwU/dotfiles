-- lua/plugins/lint.lua
return {
  "mfussenegger/nvim-lint",
  lazy = false, -- 起動時にロード
  event = { "BufReadPost", "BufNewFile" }, -- ファイル読み込み時や新規ファイル作成時にロード
  opts = {
    -- リンターの設定
    linters_by_ft = {
      -- TypeScript/JavaScript/JSX ファイルには Biome と ESLint を使用
      -- Biome を優先し、ESLint をフォールバックとして使用します
      -- Biome と ESLint は、それぞれ biome.json や .eslintrc.* ファイルを自動的に探し、
      -- それに基づいてリンティングを実行します。
      typescript = { "biome", "eslint_d" },
      javascript = { "biome", "eslint_d" },
      typescriptreact = { "biome", "eslint_d" },
      javascriptreact = { "biome", "eslint_d" },
      -- JSON ファイルには Biome を使用
      json = { "biome" },
      jsonc = { "biome" },
      -- Python ファイルには pylint を使用
      python = { "pylint" },
      -- Lua ファイルには luacheck を使用
      lua = { "luacheck" },
      -- その他のファイルタイプもここに追加できます
    },
  },
  config = function(_, opts)
    require("lint").setup(opts)

    -- ファイル保存時とカーソル移動時にリンティングを実行する autocmd を設定
    -- これにより、リアルタイムで診断情報が更新されます
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "CursorHoldI" }, {
      group = vim.api.nvim_create_augroup("Linter", { clear = true }),
      callback = function()
        -- 現在のバッファに対してリンティングを試行
        require("lint").try_lint()
      end,
    })
  end,
}
