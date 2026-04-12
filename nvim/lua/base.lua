vim.scriptencoding = "utf-8"
vim.lsp.inlay_hint.enable(true)
vim.o.visualbell = true
vim.wo.number = true
vim.opt.relativenumber = true
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
vim.opt.spelllang = { "en", "cjk" } -- spellcheck
vim.opt.fillchars = { eob = " " } -- ファイル末尾以降の`~`の表示を削除

vim.opt.shellcmdflag = "-c"
vim.opt.shellquote = '"'
vim.opt.shellxquote = ""
vim.o.winborder = "shadow"

local function patch_vim_highlights_query()
  local query_files = vim.treesitter.query.get_files("vim", "highlights")
  local query_file = query_files and query_files[1]
  if type(query_file) ~= "string" or query_file == "" then
    return
  end

  local query = table.concat(vim.fn.readfile(query_file), "\n")
  if query == "" or not query:find('"tab"', 1, true) then
    return
  end

  local patched_query = query:gsub('\n%s*"tab"%s*\n', "\n")
  if patched_query ~= query then
    vim.treesitter.query.set("vim", "highlights", patched_query)
  end
end

pcall(patch_vim_highlights_query)

-- os毎の使用するshellの設定
if vim.fn.has("win64") == 1 then
  -- Windowsの場合
  local home = os.getenv("USERPROFILE") or "C:\\Users\\Default"
  vim.opt.shell = home .. "\\AppData\\Local\\nu\\bin\\nu.exe"
  vim.opt.shell = "nu"
elseif vim.fn.has("mac") == 1 then
  -- Macの場合
  vim.opt.shell = "/bin/zsh"
else
  -- Linuxの場合
  vim.opt.shell = "/bin/bash"
end
