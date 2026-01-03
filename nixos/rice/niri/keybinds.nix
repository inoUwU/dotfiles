{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  noctalia = cmd:
    [
      "noctalia-shell"
      "ipc"
      "call"
    ]
    ++ (pkgs.lib.splitString " " cmd);
in {
  programs.niri.settings.binds = with config.lib.niri.actions; {
    "Mod+Alt+S".action.spawn = noctalia "controlCenter toggle";
    "Mod+Alt+S".hotkey-overlay.title = "Control Center 🏠";

    "Mod+Alt+Comma".action.spawn = noctalia "settings toggle";
    "Mod+Alt+Comma".hotkey-overlay.title = "Settings 🗒️";

    "Mod+Shift+Comma".action.spawn = noctalia "sessionMenu toggle";
    "Mod+Shift+Comma".hotkey-overlay.title = "Show Session Menu ⛓️";

    "Mod+Alt+Escape".action.spawn = noctalia "lockScreen lock";
    "Mod+Alt+Escape".hotkey-overlay.title = "Lock Screen ⛓️";

    "Mod+Shift+Alt+Escape".action.spawn = noctalia "sessionMenu lockAndSuspend";
    "Mod+Shift+Alt+Escape".hotkey-overlay.title = "Suspend System 💤";

    "Mod+Insert".action.spawn = noctalia "screenRecorder toggle";
    "Mod+Insert".hotkey-overlay.title = "Screen Recording 🎬";

    "Mod+Home".action.spawn = noctalia "notifications toggleDND";
    "Mod+Home".hotkey-overlay.title = "Toggle Do-Not-Disturb 🔕";
    "Mod+Home".allow-when-locked = true;

    "Mod+Delete".action.spawn = noctalia "notifications clear";
    "Mod+Delete".hotkey-overlay.title = "Clear Notifications 🔔";
    
    # Standard binds
    "Mod+Return".action.spawn = "ghostty";
    "Mod+Space".action.spawn = "vicinae";
    "Mod+D".action.spawn = "rofi -show drun";
    "Mod+Q".action.close-window = [];
  };
}
