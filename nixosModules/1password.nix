{ lib, config, ... }: {
  options = {
    vt.apps.onepassword = {
      enable = lib.mkEnableOption "1Password";
      sshIntegration = lib.mkEnableOption "Ssh";
      username = lib.mkOption {
        type = lib.types.str;
        description = "User logged in username";
      };

      zshOpPlugins = {
        gh = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable 1Password plugin for gh";
        };

        cargo = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable 1Password plugin for cargo";
        };
      };
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

    programs.zsh.shellAliases = {
      gh = lib.mkIf config.vt.apps.onepassword.zshOpPlugins.gh
        "op plugin run -- gh";
      cargo = lib.mkIf config.vt.apps.onepassword.zshOpPlugins.cargo
        "op plugin run -- cargo";
    };

    programs._1password-gui = {
      enable = config.vt.apps.onepassword.enable;
      polkitPolicyOwners = [ config.vt.apps.onepassword.username ];
    };
  };
}
