{ pkgs, ... }: {
  home.file.".vt/wallpapers".source = ../../wallpapers;

  imports = [ ./qtile ./picom.nix ./polybar ./flameshot.nix ./background.nix ];

  programs.rofi.enable = true;

  home.packages = with pkgs; [
    nitrogen
    gdu
    feh
  ];
}
