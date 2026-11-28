# 設定の置き場所

編集するのはリポジトリ側。Neovim が更新した `lazy-lock.json` だけは、配置先から `nvim/` にコピーして取り込む。

| 設定 | Linux / macOS の既定 | Windows の既定 |
| --- | --- | --- |
| Neovim | `~/.config/nvim/` | `%LOCALAPPDATA%\nvim\` |
| Starship | `~/.config/starship.toml` | `~\.config\starship.toml` |
| Vim | `~/.vimrc` | `~\_vimrc` |
| Alacritty | `~/.config/alacritty/` | `%APPDATA%\alacritty\` |
| lazygit | Linux: `~/.config/lazygit/`、macOS: `~/Library/Application Support/lazygit/` | `%LOCALAPPDATA%\lazygit\`（既存設定があれば `%APPDATA%\lazygit\` も使用） |
| WezTerm | `~/.config/wezterm/` | `~\.config\wezterm\` |
| Nushell | 配置なし | `%APPDATA%\nushell\autoload\` |
| Ghostty | `~/.config/ghostty/` | 配置なし |
| tmux | `~/.tmux.conf` | 配置なし |

Windows メモ:

- Starship が古い `%LOCALAPPDATA%\starship.toml` を見ていたら `STARSHIP_CONFIG` を外す。
- Nushell の `repos` は `ghq` と `fzf` が必要。`config.nu` の旧 `repos` 定義だけ消してシェルを開き直す。`ghq.root` は端末側の Git 設定で管理。
- Alacritty から WSL で開くときは `alacritty -e wsl.exe ~`。

`maya_setup_en.bat` は chezmoi の対象外。旧 [NixOS 設定](../nixos/) も未使用のまま別管理。
