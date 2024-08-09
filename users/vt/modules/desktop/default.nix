{ pkgs, ... }: {
  imports = [ ./polybar ./flameshot.nix ];

  programs.rofi.enable = true;

  home.packages = with pkgs; [ nitrogen gdu feh volumeicon ];
}
