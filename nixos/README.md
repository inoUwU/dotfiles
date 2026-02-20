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

## ディレクトリ構造（詳細）

```
nixos/
├── flake.nix                  # Flake エントリポイント
├── flake.lock                 # Flake ロックファイル
├── configuration.nix          # ベアメタル向けシステム設定
├── hardware-configuration.nix # nixos-generate-config で生成
├── home.nix                   # ベアメタル向け Home Manager 設定
├── host/
│   ├── host-configuration.nix #   エントリポイント
│   ├── programs.nix           #   システムパッケージ・フォント
│   ├── services.nix           #   ネットワーク・音声・表示
│   └── user-settings.nix      #   ユーザー・ロケール・タイムゾーン
├── hw/
│   └── hw.nix                 # NVIDIA GPU 設定
├── apps/                      # Home Manager アプリ設定
├── rice/                      # デスクトップ環境設定
└── wsl/                       # WSL 向け設定
    ├── configuration.nix      #   WSL システム設定
    └── home.nix               #   WSL Home Manager 設定
```

---

## 初期化ガイド / Initialization Guide

### ベアメタル / 通常 NixOS

#### 前提条件

- NixOS インストール済み（ISO インストーラーで初期セットアップ完了）
- NVIDIA GPU 搭載マシン（`hw/hw.nix` を参照）

#### 手順

**1. リポジトリのクローン**

```bash
git clone https://github.com/inoUwU/dotfiles.git ~/dotfiles
cd ~/dotfiles/nixos
```

**2. ハードウェア設定の置き換え**

`hardware-configuration.nix` は自分のマシン向けに生成し直してください。  
リポジトリのファイルにはこのリポジトリ作者のディスク UUID・CPU 情報が含まれており、  
そのまま使用すると起動失敗やファイルシステムのマウントエラーが発生します。

```bash
sudo nixos-generate-config --show-hardware-config > hardware-configuration.nix
```

**3. ユーザー名の変更（必要に応じて）**

デフォルトのユーザー名は `ino` です。変更する場合は以下のファイルを編集してください。

| ファイル | 変更箇所 |
|---------|---------|
| `host/user-settings.nix` | `users.users.ino` → 任意のユーザー名 |
| `home.nix` | `home.username`, `home.homeDirectory` |
| `configuration.nix` | `home-manager.users."ino"` |

**4. システムの適用**

```bash
sudo nixos-rebuild switch --flake .#nixos
```

---

### WSL セットアップ

WSL では [NixOS-WSL](https://github.com/nix-community/NixOS-WSL) を使用します。  
ブートローダー・NVIDIA ドライバー・ディスプレイマネージャー・Wayland コンポジター・Pipewire・NetworkManager・Fcitx5 はベアメタル向け設定から除外されています。

#### ベアメタルと WSL の差異

| 機能 | ベアメタル | WSL |
|------|-----------|-----|
| ブートローダー (systemd-boot) | ✅ | ❌ (WSL が管理) |
| NVIDIA ドライバー | ✅ | ❌ (WSL GPU passthrough) |
| ディスプレイマネージャー (GDM) | ✅ | ❌ |
| Wayland コンポジター (Niri / Hyprland) | ✅ | ❌ (WSLg で表示) |
| Pipewire / 音声 | ✅ | ❌ (Windows 音声) |
| NetworkManager | ✅ | ❌ (Windows ネットワーク) |
| 日本語入力 (Fcitx5) | ✅ | ❌ |
| デスクトップ rice (Noctalia / Vicinae) | ✅ | ❌ |
| CLI / TUI ツール | ✅ | ✅ |
| フォント | ✅ | ✅ |

#### 前提条件

- Windows 10 バージョン 2004 以降、または Windows 11
- WSL2 が有効（`wsl --install` で有効化）
- [NixOS-WSL](https://github.com/nix-community/NixOS-WSL/releases) の最新 tarball をインストール済み

#### 手順

**1. NixOS-WSL のインストール（PowerShell）**

```powershell
# https://github.com/nix-community/NixOS-WSL/releases から
# nixos-wsl.tar.gz をダウンロードして実行（x86_64 の場合）
wsl --import NixOS $env:USERPROFILE\NixOS\ nixos-wsl.tar.gz
wsl -d NixOS
```

**2. Flakes を有効化（WSL 内）**

```bash
mkdir -p ~/.config/nix
echo 'experimental-features = nix-command flakes' >> ~/.config/nix/nix.conf
```

**3. リポジトリのクローン**

```bash
git clone https://github.com/inoUwU/dotfiles.git ~/dotfiles
cd ~/dotfiles/nixos
```

**4. ユーザー名の変更（必要に応じて）**

デフォルトのユーザー名は `ino` です。変更する場合は以下のファイルを編集してください。

| ファイル | 変更箇所 |
|---------|---------|
| `host/user-settings.nix` | `users.users.ino` → 任意のユーザー名 |
| `wsl/configuration.nix` | `wsl.defaultUser`, `home-manager.users."ino"` |
| `wsl/home.nix` | `home.username`, `home.homeDirectory` |

**5. システムの適用**

```bash
sudo nixos-rebuild switch --flake .#wsl
```

**6. WSL の再起動（PowerShell）**

```powershell
wsl --shutdown
wsl -d NixOS
```

---

## セットアップ & 更新

設定を適用するには、以下のコマンドを `dotfiles/nixos/` ディレクトリで実行します。

```bash
# ベアメタル
sudo nixos-rebuild switch --flake .#nixos

# WSL
sudo nixos-rebuild switch --flake .#wsl

# nh を使う場合
nh os switch .

# Flake 入力の更新
nix flake update
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
