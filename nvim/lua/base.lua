vim.o.encofing = "utf-8"
vim.scriptencoding = "utf-8"

vim.o.visualbell = true
vim.wo.number = true
vim.opt.clipboard = "unnamedplus" -- クリップボードとレジスタを共有
vim.opt.swapfile = false -- スワップファイルを生成しない
vim.opt.cursorline = true -- カーソルが存在する行にハイライトを当てる
vim.opt.cursorcolumn = false -- カーソルが存在する列にハイライトを当てる

vim.opt.inccommand = "split"

if vim.fn.has("win64") == 1 then
	-- Windowsの場合
	vim.opt.shell = "nu"
	vim.opt.shellcmdflag = ""
	vim.opt.shellquote = '"'
	vim.opt.shellxquote = ""
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
