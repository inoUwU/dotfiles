packadd vim-jetpack
call jetpack#begin()
Jetpack 'tani/vim-jetpack', {'opt': 1} "bootstrap
Jetpack 'mattn/vim-sonictemplate' "template
Jetpack 'tyru/caw.vim.git' "multiline commentout
Jetpack 'cohama/lexima.vim' "auto brackets
Jetpack 'rainglow/vim' "color pack
Jetpack 'preservim/nerdtree' 
" Jetpack 'dense-analysis/ale' "ALE
call jetpack#end()


" カーソルの書き換え
if has('vim_starting')
    " 挿入モード時に非点の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif

syntax on
colorscheme default
set nocompatible
set encoding=UTF-8
set number
set relativenumber
set cursorline
set noswapfile
set confirm
set clipboard&
set clipboard^=unnamedplus
set mouse=a
set backspace=indent,eol,start
set nobackup
set noswapfile

" === Edit ===
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" モードを表示する
set showmode
" タイトルを表示
set title

" === keymap ===
" Leader キーをスペースキーに変更
let g:mapleader = "\<Space>"
nnoremap <C-s> :w<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

