{ pkgs, inputs,  ... }:

{
  home.file.".config/picom/picom-workaround.conf".source = ../../dotfiles/picom.conf;
  services.picom.enable = true;

  home.file.".config/qtile".source = ../../dotfiles/qtile;

  home.packages = with pkgs; [
    nix-output-monitor
    fastfetch
    nitrogen
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
