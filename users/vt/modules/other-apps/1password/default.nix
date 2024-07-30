{ pkgs, ... }: {
  home.packages = with pkgs; [
    _1password
    _1password-gui
  ];

  programs.ssh.extraConfig = ''
    Host *
        IdentityAgent "~/.1passord/agent.sock
  '';
}
