{ lib, config, username, ... }: {
  options = {
    vt.apps.onepassword = {
      enable = lib.mkEnableOption "1Password";
      sshIntegration = lib.mkEnableOption "Ssh";
    };
  };

  config = {
    programs._1password.enable =
      lib.mkIf config.vt.apps.onepassword.enable true;
    programs.ssh.extraConfig =
      lib.mkIf config.vt.apps.onepassword.sshIntegration ''
        Host *
            IdentityAgent "~/.1passord/agent.sock"
      '';

    programs._1password-gui = {
      enable = config.vt.apps.onepassword.enable;
      polkitPolicyOwners = [ username ];
    };
  };
}
