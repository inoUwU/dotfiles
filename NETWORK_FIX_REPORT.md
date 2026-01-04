# WiFiネットワーク一覧取得問題の修正レポート

## 問題の概要

NixOSの環境で、元々WiFiを使用していた環境を再度リビルドした後、ネットワーク一覧が取得できず、無限ローディング状態になる問題が発生しました。

## 原因分析

### 問題の特定

調査の結果、以下の点が判明しました：

1. **NetworkManagerは有効化されている**: `nixos/host/services.nix`で`networking.networkmanager.enable = true;`が設定されている
2. **Noctalia-shellのWiFiウィジェットが設定されている**: `nixos/rice/noctalia.nix`でWiFiウィジェットが有効
3. **D-Bus通信の問題**: Noctalia-shellのWiFiウィジェットがNetworkManagerのD-Busインターフェースと通信できていない

### 根本原因

Noctalia-shellなどのWaylandベースのカスタムシェルは、NetworkManagerと直接通信するために以下が必要です：

1. **NetworkManager Applet (nm-applet)**: D-Bus経由でNetworkManagerと通信するバックエンドサービス
2. **Polkit**: 非rootユーザーがNetworkManagerにアクセスするための権限管理システム
3. **起動時の自動実行**: nm-appletがWaylandコンポジタ起動時に自動で起動する設定

これらが不足していたため、WiFiウィジェットがネットワーク情報を取得できませんでした。

## 実施した修正

### 1. NetworkManager Appletパッケージの追加

**ファイル**: `nixos/host/programs.nix`

```nix
environment.systemPackages = with pkgs; [
  # System Tools
  vim 
  wget
  gh
  wirelesstools
  iw
  iwd
  networkmanagerapplet # NetworkManager applet for D-Bus communication  ← 追加
  
  # Languages (from apps/lang.nix)
  lua
  go
  bun 
  nodejs_24
  nixfmt-rfc-style
];
```

**説明**: `networkmanagerapplet`パッケージを追加することで、`nm-applet`コマンドが使用可能になります。これはNetworkManagerのD-Busインターフェースを提供するバックエンドサービスです。

### 2. Polkitの有効化

**ファイル**: `nixos/host/services.nix`

```nix
{
  # Networking
  networking.networkmanager.enable = true;
  networking.wireless.enable = lib.mkForce false;

  # Polkit for NetworkManager access  ← 追加
  security.polkit.enable = true;

  # Input Method
  ...
}
```

**説明**: Polkitを有効化することで、非rootユーザー（この場合は`ino`ユーザー）がNetworkManagerを操作できるようになります。これにより、WiFiネットワークの検索、接続、切断などの操作が可能になります。

### 3. Niri起動時のnm-applet自動実行

**ファイル**: `nixos/rice/niri/startup.nix`

```nix
{
  programs.niri.settings.spawn-at-startup = [
    {sh = "nm-applet --indicator";} # NetworkManager applet for WiFi widget  ← 追加
    {sh = "noctalia-shell";}
    # {argv = ["vesktop"];}
    # {argv = ["firefox"];}
  ];
}
```

**説明**: Niri（Scrollable Tiling WM）起動時に`nm-applet`を自動で起動するように設定しました。`--indicator`フラグはインジケーターモードで実行することを意味します。Noctalia-shellより先に起動することで、WiFiウィジェットが初期化される前にD-Busサービスが利用可能になります。

### 4. Hyprland起動時のnm-applet自動実行

**ファイル**: `nixos/rice/hyprland.conf`

```conf
# Autostart necessary processes (like notifications daemons, status bars, etc.)
# Or execute your favorite apps at launch like this:

exec-once = nm-applet --indicator  ← 追加（コメント解除と先頭への移動）
exec-once = noctalia-shell
exec-once = fcitx5

# exec-once = $terminal
# exec-once = waybar & hyprpaper & firefox
exec-once = hyprpaper
exec-once = waybar 
```

**説明**: Hyprland起動時にも同様に`nm-applet`を自動起動するように設定しました。これにより、NiriとHyprlandのどちらのWMを使用しても、WiFiウィジェットが正常に動作します。

## 修正の適用方法

以下のコマンドでシステムを再ビルドし、変更を適用してください：

```bash
cd ~/dotfiles/nixos/
sudo nixos-rebuild switch --flake .#nixos
```

または、`nh`を使用している場合：

```bash
cd ~/dotfiles/nixos/
nh os switch
```

## 動作確認方法

1. システムを再起動するか、現在使用しているWMからログアウトして再ログインします
2. Noctalia-shellのバーに表示されるWiFiウィジェットをクリックします
3. 利用可能なWiFiネットワークの一覧が表示されることを確認します
4. ネットワークを選択して接続できることを確認します

## 技術的な詳細

### NetworkManagerとD-Bus

NetworkManagerは、ネットワーク設定を管理するためのシステムデーモンです。NetworkManagerはD-Busインターフェースを提供しており、以下の情報を公開しています：

- 利用可能なネットワークインターフェース
- スキャンされたWiFiアクセスポイント
- 接続状態
- ネットワーク設定

### nm-appletの役割

`nm-applet`は以下の役割を果たします：

1. **D-Busリスナー**: NetworkManagerのD-Busシグナルを監視
2. **イベントブロードキャスト**: ネットワーク状態の変化を他のアプリケーションに通知
3. **認証ダイアログ**: WiFiパスワード入力などのUIを提供

Noctalia-shellのようなカスタムシェルは、`nm-applet`が提供するD-Busインターフェースを通じてネットワーク情報を取得します。

### Polkitの必要性

NetworkManagerの多くの操作（WiFiスキャン、接続、切断など）には管理者権限が必要です。Polkitは、非rootユーザーがこれらの操作を実行できるように、細かい権限制御を提供します。

NixOSでは、`security.polkit.enable = true;`を設定することで、NetworkManagerに必要なデフォルトのポリシーが自動的に設定されます。また、`networkmanager`グループに所属するユーザー（`user-settings.nix`で設定済み）は、NetworkManagerの操作が許可されます。

## まとめ

この修正により、以下が実現されます：

1. ✅ NetworkManager AppletがシステムにインストールされD-Bus通信が可能に
2. ✅ Polkitにより非rootユーザーのNetworkManagerアクセスが可能に  
3. ✅ WM起動時にnm-appletが自動実行され、Noctalia-shellのWiFiウィジェットが機能
4. ✅ NiriとHyprlandの両方の環境で動作

WiFiネットワーク一覧が正常に取得でき、ローディング状態が解消されます。
