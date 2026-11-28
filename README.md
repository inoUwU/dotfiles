# dotfiles

| Nushell                        | `nushell/`                  |
| 環境 / Platform | コマンド / Command |
| --- | --- |
| macOS（Homebrew） | `brew install chezmoi` |
| Fedora | `sudo dnf install chezmoi` |
| Arch Linux | `sudo pacman -S chezmoi` |
| Windows（Scoop） | `scoop install chezmoi` |
```sh
cd ~/dotfiles
chezmoi --source . diff
```

- [環境を戻す](docs/setup.md) — 初回セットアップと反映手順
- [設定の置き場所](docs/paths.md) — OS 別の配置先と例外
- [キーを忘れたら](docs/keys.md) — tmux / Neovim / lazygit

| ツール / Tool | Linux | macOS | Windows |
| --- | --- | --- | --- |
| Neovim | `~/.config/nvim/` | `~/.config/nvim/` | `%LOCALAPPDATA%\nvim\` |
| Starship | `~/.config/starship.toml` | `~/.config/starship.toml` | `~\.config\starship.toml` |
| Vim | `~/.vimrc` | `~/.vimrc` | `~\_vimrc` |
| Alacritty | `~/.config/alacritty/` | `~/.config/alacritty/` | `%APPDATA%\alacritty\` |
| lazygit | `~/.config/lazygit/` | `~/Library/Application Support/lazygit/` | `%LOCALAPPDATA%\lazygit\`、既存の設定があれば `%APPDATA%\lazygit\` も使用 |
| WezTerm | `~/.config/wezterm/` | `~/.config/wezterm/` | `~\.config\wezterm\` |
| Nushell (`repos`, `lg`) | 配布しません / Not deployed | 配布しません / Not deployed | `%APPDATA%\nushell\autoload\` (`repos.nu`, `aliases.nu`) |
| Ghostty | `~/.config/ghostty/` | `~/.config/ghostty/` | 配布しません / Not deployed |
| tmux | `~/.tmux.conf` | `~/.tmux.conf` | 配布しません / Not deployed |
MIT
