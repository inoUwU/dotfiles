# このconfigurationファイルを編集してシステムにインストールするものを定義します。
# ヘルプは configuration.nix(5) の man page と
# NixOS manual ('nixos-help'を実行してアクセス可能) で利用できます。

{ config, pkgs, ... }:

{
  imports =
    [ # hardware scanの結果を含める
      ./hardware-configuration.nix
    ];
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # hostnameを定義
  # networking.wireless.enable = true;  # wpa_supplicant経由でwirelessサポートを有効化

  # 必要に応じてnetwork proxyを設定
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # networkingを有効化
  networking.networkmanager.enable = true;
  networking.wireless.enable = false;

  # タイムゾーンを設定
  time.timeZone = "Asia/Tokyo";

  # 国際化プロパティを選択
  i18n.defaultLocale = "ja_JP.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ja_JP.UTF-8";
    LC_IDENTIFICATION = "ja_JP.UTF-8";
    LC_MEASUREMENT = "ja_JP.UTF-8";
    LC_MONETARY = "ja_JP.UTF-8";
    LC_NAME = "ja_JP.UTF-8";
    LC_NUMERIC = "ja_JP.UTF-8";
    LC_PAPER = "ja_JP.UTF-8"; LC_TELEPHONE = "ja_JP.UTF-8"; LC_TIME = "ja_JP.UTF-8";
  };

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
        fcitx5-mozc
        fcitx5-gtk
    ];
  };

  # X11 windowing systemを有効化
  services.xserver.enable = true;

  # GNOME Desktop Environmentを有効化
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # X11でkeymapを設定
  services.xserver.xkb = {
    layout = "jp";
    variant = "";
  };

  # ドキュメント印刷のためにCUPSを有効化
  services.printing.enable = true;

  # pipewireでサウンドを有効化
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # JACKアプリケーションを使用したい場合はこれをコメント解除
    #jack.enable = true;

    # exampleのsession managerを使用（他にはまだパッケージ化されていないため、これがデフォルトで有効
    # 今のところ設定で再定義する必要はありません）
    #media-session.enable = true;
  };

  # touchpadサポートを有効化（ほとんどのdesktopManagerでデフォルトで有効）
  # services.xserver.libinput.enable = true;

  # ユーザーアカウントを定義。'passwd'でパスワードを設定するのを忘れずに
  users.users.ino = {
    isNormalUser = true;
    description = "ino";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # firefoxをインストール
  programs.firefox.enable = true;

  # zshをインストール
  programs.zsh.enable = true;
  users.users.ino.shell = pkgs.zsh;

  
  # hyprlandをインストール
  programs.hyprland = {
    enable = true;
    # nvidiaPatches = true;
    xwayland.enable = true;
  };
   
  environment.sessionVariables = {
    # cursorが見えなくなる場合 
    WLR_NO_HARDWARE_CURSORS = "1";
    # electronアプリにwaylandを使用するようヒント
    NIXOS_OZONE_WL = "1";
  };

  hardware = {
   # Opengl
   opengl.enable = true;
  };

  # GPUパワーを有効化
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
   # ほとんどのwayland compositorにはこれが必要
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    open = false; # オープンソース版ドライバを使いたいなら true にする（ただしGTX 10xx は非対応）
    nvidiaSettings = true; # NVIDIA Settings GUIを有効にする
    package = config.boot.kernelPackages.nvidiaPackages.stable; # 最新のstable driverをインストール
  };

  # unfreeパッケージを許可
  nixpkgs.config.allowUnfree = true; # NVIDIAのドライバはUnfree

  # system profileにインストールされるパッケージのリスト。検索するには次を実行：
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim 
    wget
    gh
    
    wirelesstools
    iw
    iwd
    spotify
    discord
    alacritty
    zed-editor
   
    swww
    rofi
    kitty
    ghostty
    waybar
    hyprpaper
    eww
  ];

  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    # nerd-fonts.meslo-lg
    # nerd-fonts.noto
  ];

  # 一部のプログラムはSUID wrappersが必要で、さらに設定可能です
  # 有効化したいサービスのリスト：

  # OpenSSH daemonを有効化
  # services.openssh.enable = true;

  # firewallでポートを開く
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # またはfirewallを完全に無効化
  # networking.firewall.enable = false;

  # この値は、システム上のファイル位置やdatabaseバージョンなどの
  # statefulデータのデフォルト設定がどのNixOS releaseから取得されたかを決定します。
  # この値は、このシステムの最初のインストールのreleaseバージョンのままにしておくことが
  # 推奨されます。この値を変更する前に、このオプションのドキュメントを読んでください
  # (例: man configuration.nix または https://nixos.org/nixos/options.html)
  system.stateVersion = "24.11"; # このコメントを読みましたか？
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
