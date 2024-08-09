{ lib, config, ... }: {
  options = {
    vt.xserver = {
      enable = lib.mkEnableOption "XServer";
      gdm = lib.mkEnableOption "GDM";
      qtile = lib.mkEnableOption "qTile";
    };
  };
  config = {
    services.xserver = lib.mkIf config.vt.xserver.enable {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };

      windowManager.qtile.enable = config.vt.xserver.qtile;
      displayManager.gdm.enable = config.vt.xserver.gdm;
    };
  };
}
