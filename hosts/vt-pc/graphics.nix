{ pkgs, user, ... }: {

  hardware.graphics.enable = true;

  # Fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    font-awesome
  ];

  users.users.${user}.packages = with pkgs; [
    localsend
    todoist-electron
    discord
    steam

    pcmanfm
    networkmanagerapplet
  ];

  vt.apps.onepassword = { enable = true; };

  # programs._1password.enable = true;
  # programs.ssh.extraConfig = ''
  #   Host *
  #       IdentityAgent "~/.1passord/agent.sock"
  # '';

  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ user ];
  };
}
