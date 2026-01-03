{ config, pkgs,inputs,lib, ... }:

{
  # Home Managerはあなたと管理すべきパスについての情報が必要です
  home.username = "ino";
  home.homeDirectory = "/home/ino";

  imports = [
    inputs.vicinae.homeManagerModules.default
    ./rice/rice.nix
    ./apps/apps.nix
  ];

  # この値は、あなたの設定が互換性を持つHome Manager releaseを決定します。
  # これは、新しいHome Manager releaseが後方互換性のない変更を導入したときに
  # 破損を避けるのに役立ちます。
  #
  # Home Managerを更新する場合でも、この値を変更すべきではありません。
  # もし値を更新したい場合は、必ず最初にHome Managerのrelease notesを確認してください。
  home.stateVersion = "24.05"; # 変更する前にこのコメントを読んでください

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # home.packagesオプションを使用すると、Nixパッケージを環境にインストールできます
  home.packages = [
    # # 'hello'コマンドを環境に追加します。実行すると
    # # "Hello, world!" と表示されます。
    # pkgs.hello

    # # パッケージを微調整すると便利な場合があります。例えば、
    # # overrideを適用することができます。ここで直接行うことができますが、
    # # 括弧を忘れないでください。限られた数のフォントで
    # # Nerd Fontsをインストールしたいかもしれません。
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # 設定内で直接シンプルなshell scriptを作成することもできます。
    # # 例えば、これは 'my-hello' コマンドを環境に追加します：
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    #
    pkgs.nixfmt-rfc-style 
  ];

  # Home Managerはdotfilesの管理が得意です。plain fileを管理する主な方法は
  # 'home.file'を使用することです。
  home.file = {
    # # この設定をビルドすると 'dotfiles/screenrc' のコピーが
    # # Nix storeに作成されます。設定をactivateすると '~/.screenrc' が
    # # Nix storeのコピーへのsymlinkになります。
    # ".screenrc".source = dotfiles/screenrc;

    # # ファイルの内容を直接設定することもできます。
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Managerは 'home.sessionVariables' を通じて環境変数も管理できます。
  # これらはHome Managerが提供するshellを使用する際に明示的にsourceされます。
  # Home Managerでshellを管理したくない場合は、手動で 'hm-session-vars.sh' を
  # sourceする必要があります。これは以下のいずれかに配置されています：
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # または
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # または
  #
  #  /etc/profiles/per-user/ino/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Home Manager自身をインストールして管理させます
  programs.home-manager.enable = true;
}
