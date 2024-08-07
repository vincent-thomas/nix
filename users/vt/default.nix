{ ... }: {
  home.stateVersion = "23.11";

  imports = [ ./modules/desktop ./modules/x11-init ./git.nix ./misc.nix ];

  # General
  vt.dot.wallpapers = true;
  vt.dot.scripts = true;
  vt.dot.zshIntegration = true;

  # Terminal / Shell
  vt.kitty.enable = true;

  vt.starship.enable = true;
  vt.zsh = {
    enable = true;
    starshipIntegration = true;
  };

  vt.cliTools.enable = true;
  vt.cliTools.zshIntegration = true;

  # Dev Setup
  vt.nvim = {
    enable = true;
    defaultEditor = true;
  };
  vt.zellij.enable = true;

  # Setup
  vt.spotifyd.enable = true;
  vt.picom.enable = true;
  vt.qtile.config.enable = true;
  vt.firefox.enable = true;

  programs.imv.enable = true;

  xdg.userDirs.desktop = null;
}
