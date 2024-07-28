{ config, lib, pkgs, modulesPath, ... }:
{
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
 
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    windowManager.qtile.enable = true;
  };

  programs = {
    zsh.enable = true;
    thunar.enable = true;
    _1password.enable = true;
    _1password-gui = {
      enable = true;
      polkitPolicyOwners = [ "vt" ];
    };
  };
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  
  xdg.portal.enable = true;
  security.polkit.enable = true;
}
