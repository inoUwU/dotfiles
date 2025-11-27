--                                     ██
--                                    ░░
--  ███████   █████   ██████  ██    ██ ██ ██████████
-- ░░██░░░██ ██░░░██ ██░░░░██░██   ░██░██░░██░░██░░██
--  ░██  ░██░███████░██   ░██░░██ ░██ ░██ ░██ ░██ ░██
--  ░██  ░██░██░░░░ ░██   ░██ ░░████  ░██ ░██ ░██ ░██
--  ███  ░██░░██████░░██████   ░░██   ░██ ███ ░██ ░██
-- ░░░   ░░  ░░░░░░  ░░░░░░     ░░    ░░ ░░░  ░░  ░░

vim.g.mapleader = " "
if vim.g.vscode then
  require("vscode_setting")
else
  require("base")
end

vim.filetype.add({
  pattern = {
    [".*/%.github[%w/]+workflows[%w/]+.*%.ya?ml"] = "yaml.github",
  },
})

require("lsp")
require("lazy_nvim")

local theme = require("last-color").recall() or "yoda"
vim.cmd.colorscheme(theme)

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- vim.scheduleでlazy.nvimの統計情報が更新された後にダッシュボードを初期化
    -- これにより、正しい起動時間が表示される
    vim.schedule(function()
      require("snacks").dashboard.setup()
      require("snacks").input.enable()
    end)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "yaml.github",
  callback = function()
    print("GitHub Actions YAML file detected!")
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("vim-treesitter-start", {}),
  callback = function(ctx)
    -- 必要に応じて`ctx.match`に入っているファイルタイプの値に応じて挙動を制御
    -- `pcall`でエラーを無視することでパーサーやクエリがあるか気にしなくてすむ
    pcall(vim.treesitter.start)
  end,
})
