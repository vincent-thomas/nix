{ pkgs, user, ... }: {



  # XServer
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
 
    displayManager.gdm.enable = true;
    windowManager.qtile.enable = true;
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    font-awesome
  ];

  users.users.${user}.packages = with pkgs; [
    localsend
    todoist-electron
    discord
    polkit_gnome
    steam

    pcmanfm
    networkmanagerapplet
  ];

  programs._1password.enable = true;
  programs.ssh.extraConfig = ''
    Host *
        IdentityAgent "~/.1passord/agent.sock"
  '';

  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ user ];
  };
}
