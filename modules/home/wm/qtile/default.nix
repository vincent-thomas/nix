{ config, lib, ... }: {
  options = {
    vt.qtile.config.enable = lib.mkEnableOption "Enables Qtile configuration";
  };
  config = {
    home.file.".config/qtile".source =
      lib.mkIf config.vt.qtile.config.enable ./config;
  };
}
