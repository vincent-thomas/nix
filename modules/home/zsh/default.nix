{ lib, config, ... }: {
  options = {
    vt.zsh = {
      enable = lib.mkEnableOption "Enables zsh";
      nvimAlias = lib.mkEnableOption "Should enable 'v' alias";
      starshipIntegration =
        lib.mkEnableOption "Enables starship integration with zsh";
    };
  };

  config = lib.mkIf config.vt.zsh.enable {

    vt.starship.zshIntegration = config.vt.zsh.starshipIntegration;
    programs.zsh = {
      enable = true;
      sessionVariables = { HOME_MNGR_DIR = "$HOME/nix"; };
      dotDir = ".config/zsh";

      shellAliases = {
        v = "nvim";
        hms =
          "rm -f /home/vincent/.mozilla/firefox/vincent/search.json.mozlz4 && revision";
      };
      initExtra = ''
        ${builtins.readFile ./.zshrc}
      '';
    };
  };
}
