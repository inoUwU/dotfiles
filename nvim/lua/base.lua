vim.scriptencoding = "utf-8"
vim.lsp.inlay_hint.enable(true)
vim.o.visualbell = true
vim.wo.number = true
vim.opt.clipboard = "unnamedplus" -- クリップボードとレジスタを共有
vim.opt.swapfile = false -- スワップファイルを生成しない
vim.opt.cursorline = true -- カーソルが存在する行にハイライトを当てる
vim.opt.cursorcolumn = false -- カーソルが存在する列にハイライトを当てる
vim.o.mouse = "a" -- マウスの有効化
vim.o.signcolumn = "yes:2" -- アイコン列を表示する max width 2
vim.g.loaded_netrw = 1 -- netrw無効
vim.g.loaded_netrwPlugin = 1 -- netrw無効
vim.opt.termguicolors = true -- enable 24-bit colour
vim.opt.inccommand = "split"
vim.api.nvim_set_keymap("x", "p", '"_dP', { noremap = true, silent = true }) -- Visual mode keymap to prevent clipboard overwrite on paste

-- os毎の使用するshellの設定
if vim.fn.has("win64") == 1 then
  -- Windowsの場合
  local home = os.getenv("USERPROFILE") or "C:\\Users\\Default"
  vim.opt.shell = home .. "\\AppData\\Local\\nu\\bin\\nu.exe"
  vim.opt.shell = "nu"
  -- vim.opt.shellcmdflag = ""
  -- vim.opt.shellquote = '"'
  -- vim.opt.shellxquote = ""
elseif vim.fn.has("mac") == 1 then
  -- Macの場合
  vim.opt.shell = "/bin/zsh"
  vim.opt.shellcmdflag = "-c"
  vim.opt.shellquote = '"'
  vim.opt.shellxquote = ""
else
  -- Linuxの場合
  vim.opt.shell = "/bin/bash"
  vim.opt.shellcmdflag = "-c"
  vim.opt.shellquote = '"'
  vim.opt.shellxquote = ""
end
