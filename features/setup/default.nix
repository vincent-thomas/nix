{ pkgs, inputs,  ... }:

{
  home.file.".config/picom/picom-workaround.conf".source = ../../dotfiles/picom.conf;
  services.picom.enable = true;

  home.file.".config/qtile".source = ../../dotfiles/qtile;

  home.file.".config/polybar".source = ../../dotfiles/polybar;
  services.polybar = {
    catppuccin.enable = false;
    enable = true;
    script = "polybar";
  };

  programs.rofi = {
    enable = true;
  };
}
