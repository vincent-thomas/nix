{ pkgs, ... }: {
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
  # xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
}
