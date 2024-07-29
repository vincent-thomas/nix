{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "";
 
    displayManager.gdm.enable = true;
    # desktopManager.gnome.enable = true;
    # desktopManager.plasma6.enable = true;
    windowManager.qtile.enable = true;
  };

  programs = {
    zsh.enable = true;
    thunar.enable = true;
    # _1password.enable = true;
    # _1password-gui = {
    #   enable = true;
    #   polkitPolicyOwners = [ "vt" ];
    # };
  };
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
  
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
  security.polkit.enable = true;
  #
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
    };
  };

}
