{ pkgs, ... }: {
  home.file.".vt/wallpapers".source = ../../wallpapers;

  imports = [ ./qtile ./picom ];

  # home.file.".config/picom/picom-workaround.conf".source = ../../dotfiles/picom.conf;
  # services.picom = {
  #   enable = true;
  #   extraArgs = [ "--config ~/.config/picom/picom-workaround.conf" ];
  # };

  programs.rofi.enable = true;

  home.packages = with pkgs; [
    nitrogen
  ];
}
