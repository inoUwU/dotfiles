{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    ghq
    xh
    fd
    ripgrep
    microfetch
    lazydocker
    lazyjj
    jujutsu
    helix
    gh
    copilot-cli
  ];

  programs.bottom.enable = true;
  programs.numbat.enable = true;
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.lazygit.enable = true;

programs.neovim = {
  enable = true;
  extraPackages = with pkgs; [
    go        
    gopls     
    nodejs
  ];
};
xdg.configFile."nvim".source = ../../nvim;
}
