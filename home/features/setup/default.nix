{ pkgs,  ... }:

{
  imports = [./ssh.nix ./wayland.nix];
  home.file.".config/picom/picom-workaround.conf".source = ../../dotfiles/picom.conf;
  home.file.".vt/Wallpapers".source = ../../../static/wallpapers;
  services.picom = {
    enable = true;
    extraArgs = [ "--config ~/.config/picom/picom-workaround.conf" ];
  };

  home.file.".config/qtile".source = ../../dotfiles/qtile;

  home.packages = with pkgs; [
    nix-output-monitor
    fastfetch
    nitrogen
    _1password
    _1password-gui
    obsidian
    nodejs_22
  ];

  # programs.rofi.enable = true;
  programs.btop.enable = true;
}
