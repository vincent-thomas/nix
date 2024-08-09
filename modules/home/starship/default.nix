{ config, lib, ... }: {
  options = {
    vt.starship = {
      enable = lib.mkEnableOption "Enables zsh";
      zshIntegration =
        lib.mkEnableOption "Enables zsh integration with starship";
    };
  };
  config = lib.mkIf config.vt.starship.enable {
    home.file.".config/starship.toml".source = ./starship.toml;
    programs.starship = {
      enable = true;
      enableZshIntegration = config.vt.starship.zshIntegration;
      catppuccin.enable = false;
    };
  };
}
