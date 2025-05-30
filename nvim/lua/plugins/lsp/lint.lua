-- lua/plugins/lint.lua
return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local lint = require("lint")
    local uv = vim.uv

    -- biome の設定（biome.json がある場合にのみ有効）
    lint.linters.biome = {
      cmd = "biome",
      args = { "check", "--formatter-enabled=false", "--quiet", "--json" },
      stdin = false,
      ignore_exitcode = true,
      parser = require("lint.parser").from_errorformat("%f:%l:%c %t%*[^ ] %m", {
        source = "biome",
        severity = {
          E = vim.diagnostic.severity.ERROR,
          W = vim.diagnostic.severity.WARN,
          I = vim.diagnostic.severity.INFO,
        },
      }),
      run_if = function()
        return uv.fs_stat(uv.cwd() .. "/biome.json") ~= nil
      end,
    }

    -- eslint_d の設定（.eslintrc.* がある場合にのみ有効）
    lint.linters.eslint_d = {
      cmd = "eslint_d",
      args = {
        "--format",
        "json",
        "--stdin",
        "--stdin-filename",
        function()
          return vim.api.nvim_buf_get_name(0)
        end,
      },
      stdin = true,
      ignore_exitcode = true,
      parser = require("lint.parser").from_errorformat("%f:%l:%c %t%*[^ ] %m", {
        source = "eslint_d",
        severity = {
          E = vim.diagnostic.severity.ERROR,
          W = vim.diagnostic.severity.WARN,
          I = vim.diagnostic.severity.INFO,
        },
      }),
      run_if = function()
        local config_files = {
          ".eslintrc.js",
          ".eslintrc.cjs",
          ".eslintrc.yaml",
          ".eslintrc.yml",
          ".eslintrc.json",
          ".eslintrc",
        }
        for _, file in ipairs(config_files) do
          if uv.fs_stat(uv.cwd() .. "/" .. file) then
            return true
          end
        end
        return false
      end,
    }

    local function has_file(filenames)
      local cwd = vim.fn.getcwd()
      for _, name in ipairs(filenames) do
        if vim.uv.fs_stat(cwd .. "/" .. name) then
          return true
        end
      end
      return false
    end

    -- ファイルタイプごとの linter 設定
    local use_biome = has_file({ "biome.json" })

    lint.linters_by_ft = {
      typescript = { "biome" } or { "eslint_d" },
      javascript = { "biome" } or { "eslint_d" },
      typescriptreact = use_biome and { "biome" } or { "eslint_d" },
      javascriptreact = use_biome and { "biome" } or { "eslint_d" },
      json = use_biome and { "biome" } or {},
      jsonc = use_biome and { "biome" } or {},
      python = { "pylint" },
      lua = { "luacheck" },
    }
    -- Lint を実行するタイミング（保存後・カーソル移動時）
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold" }, {
      group = vim.api.nvim_create_augroup("LintAutocmds", { clear = true }),
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
