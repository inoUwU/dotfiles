{
  config,
  inputs,
  pkgs,
  ...
}:
# Start the following programs at launch
{
  programs.niri.settings.spawn-at-startup = [
    {sh = "nm-applet --indicator";} # NetworkManager applet for WiFi widget
    {sh = "noctalia-shell";}
    # {argv = ["vesktop"];}
    # {argv = ["firefox"];}
  ];
}
