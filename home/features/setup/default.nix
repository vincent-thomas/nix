{ pkgs,  ... }:

{
  imports = [./ssh.nix];
  home.file.".config/picom/picom-workaround.conf".source = ../../dotfiles/picom.conf;
  home.file."Wallpapers".source = ../../../static/wallpapers;
  services.picom.enable = true;

  home.file.".config/qtile".source = ../../dotfiles/qtile;

  home.packages = with pkgs; [
    nix-output-monitor
    fastfetch
    nitrogen
    _1password
    _1password-gui
  ];

  programs.btop = {
    enable = true;
    settings = {
      # color_theme = "onedark";
      theme_background = false;
    };
  };

  programs.rofi = {
    enable = true;
  };
}
