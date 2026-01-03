{...}: {
  programs.niri.settings = {
    layout = {
      gaps = 4;
      background-color = "00000000";
      center-focused-column = "on-overflow";
      preset-column-widths = [
        {proportion = 0.33333;}
        {proportion = 0.5;}
        {proportion = 0.66667;}
      ];
      preset-window-heights = [
        {proportion = 0.33333;}
        {proportion = 0.5;}
        {proportion = 0.66667;}
        {proportion = 1.0;}
      ];
      struts = {
        bottom = 7;
        top = 7;
        left = 7;
        right = 7;
      };

      default-column-display = "tabbed";

      tab-indicator = {
        enable = true;
        hide-when-single-tab = true;
        place-within-column = true;
        position = "left";
        width = 4.0;
        length.total-proportion = 0.66667;
        corner-radius = 3.0;
        gap = 4.0;
        gaps-between-tabs = 2.0;
        active.color = "#15e62ae3";
        inactive.gradient.from = "#1c68e2ff";
        inactive.gradient.to = "#b51de0ff";
        urgent.color = "#e44949ff";
      };

      default-column-width.proportion = 0.33333;
      focus-ring = {
        enable = true;
        width = 1;
      };
    };
  };
}
