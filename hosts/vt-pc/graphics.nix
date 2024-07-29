{ pkgs, ... }: {

  # XServer
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
 
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    windowManager.qtile.enable = true;
  };

  xdg.portal.enable = true;

  # Fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  programs.thunar.enable = true;
  users.users.vt.packages = with pkgs; [
    localsend
    todoist-electron
    discord
    polkit_gnome
  ];
}
