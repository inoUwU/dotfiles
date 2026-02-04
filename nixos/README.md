<div align="center">
  <img src="https://brand.nixos.org/logos/nixos-logo-default-gradient-black-regular-horizontal-recommended.svg" width="100">
  
  <h1>dotfiles</h1>
  <i>Fract's NixOS Dotfiles.</i>
</div>

## 概要

このリポジトリは NixOS のシステム設定 (`configuration.nix`) とユーザー環境 (`home-manager`) を統合管理しています。
`flake.nix` を中心に、システム全体の設定を一括で適用できる構成になっています。
Based on [blkedn](https://github.com/vicinaehq/blkedn).

## ディレクトリ構造

- **`flake.nix`**: エントリーポイント。システム定義 (`nixosConfigurations`) を記述。
- **`configuration.nix`**: システム設定のハブ。`host`, `hw`, `home-manager` を読み込む。
- **`host/`**: ホスト固有の設定。
  - `programs.nix`: システムパッケージ、Hyprlandの有効化。
  - `services.nix`: ネットワーク、オーディオ(Pipewire)、日本語入力(Fcitx5)。
  - `user-settings.nix`: ユーザー定義、ロケール、環境変数。
- **`hw/`**: ハードウェア固有の設定。
  - `hw.nix`: グラフィックス、NVIDIAドライバ設定。
- **`rice/`**: デスクトップ環境 (Rice) の設定。
  - **`niri/`**: Niri (Scrollable Tiling WM) の設定ファイル群。
  - **`hypr.nix`**: Hyprland の設定 (`hyprland.conf` の配置)。
  - **`noctalia.nix`**: シェル・バー (Noctalia) の設定。
  - **`vicinae.nix`**: ランチャー (Vicinae) の設定。
- **`apps/`**: アプリケーションごとの設定。
  - `ghostty.nix`, `zsh.nix`, `web.nix` など、カテゴリごとに分割。

## 主なコンポーネント

| Component    | Name            | Description                                   |
| ------------ | --------------- | --------------------------------------------- |
| **OS**       | NixOS           | Unstable channel                              |
| **WM**       | Hyprland / Niri | ログイン画面で選択可能                        |
| **Shell**    | Noctalia        | ステータスバー、通知、コントロールセンター    |
| **Launcher** | Vicinae         | アプリ起動、クリップボード管理 (Raycast like) |
| **Terminal** | Ghostty         | メインターミナル                              |
| **Shell**    | Zsh             | ユーザーシェル                                |
| **Input**    | Fcitx5 + Mozc   | 日本語入力                                    |

## セットアップ & 更新

設定を適用するには、以下のコマンドをリポジトリルート (`dotfiles/nixos/`) で実行します。

```bash
# システムとユーザー設定を一括更新
nixos-rebuild switch --flake ./nixos

# 依存関係の更新
nix flake update --flake ./nixos
```

## 使い方

### セッションの切り替え

PC起動後のログイン画面 (GDM) にて、ユーザーを選択した後、右下の歯車アイコン⚙️をクリックすることで **Hyprland** または **Niri** を選択できます。Niri が表示されない場合は `services.displayManager.sessionPackages = with pkgs; [ niri ];` を設定して `nixos-rebuild switch --flake ./nixos` を実行してください。

### キーバインド (Niri / 共通)

| Action             | Keybinding          | Command       |
| ------------------ | ------------------- | ------------- |
| **Launcher**       | `Super + Space`     | Vicinae       |
| **Terminal**       | `Super + Enter`     | Ghostty       |
| **App Launcher**   | `Super + D`         | Rofi (Backup) |
| **Close Window**   | `Super + Q`         | -             |
| **Control Center** | `Super + Alt + S`   | Noctalia      |
| **Settings**       | `Super + Alt + ,`   | Noctalia      |
| **Lock Screen**    | `Super + Alt + Esc` | Noctalia      |
| **Session Menu**   | `Super + Shift + ,` | Noctalia      |

※ Hyprland の詳細なキーバインドは `rice/hyprland.conf` を参照してください。
