{ pkgs, ... }:
{

  home.file.".config/hypr".source = ../../dotfiles/hyprland;

  programs.waybar.enable = true;
  programs.ags = {
    enable = true;

    configDir = ../../dotfiles/ags;

    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
      accountsservice

      swww

      wofi
    ];
  };
}
